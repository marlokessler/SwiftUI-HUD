//
//  HUD.swift
//  HUD
//
//  Created by Marlo Kessler on 11.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI
import Indicators

@available(iOS 13.0, *)
struct HUD: View {
    
    
    
    // MARK: - Initializer
    init(_ type: HUDType, in frame: CGSize, with configuration: HUDConfiguration?) {
        self.type = type
        self.frame = frame
        self.configuration = configuration
    }
    
    
    
    // MARK: - Variables
    private var type: HUDType
    private var frame: CGSize
    private var configuration: HUDConfiguration?
    
    private var edgeLength: CGFloat {
        return frame.width > frame.height
            ? frame.height / 2
            : frame.width / 2
    }
    
    
    
    // MARK: - Views
    private func prepareIndicator<I: Indicator>(_ indicator: I) -> I {
        
        guard let con = configuration else { return indicator }
        
        var i = indicator
        
        if let lineWidth = con.lineWidth { i = i.lineWidth(lineWidth) }
        if let pace = con.pace { i = i.pace(pace) }
        if let foregroundColor = con.foregroundColor { i = i.foregroundColor(foregroundColor) }
        if let animated = con.animated { i = i.animated(animated) }
        if let customAnimation = con.customAnimation { i = i.animation(customAnimation) }
        
        i = (i as? LinearWaitingIndicator)?.font(con.font) as? I ?? i
        i = (i as? LinearProgressIndicator)?
                .font(con.font)
            .backgroundColor(con.backgroundStrokeColor ?? Color.white.opacity(0.5)) as? I ?? i
        i = (i as? CircularProgressIndicator)?
                .backgroundColor(con.backgroundStrokeColor ?? Color.white.opacity(0.5)) as? I ?? i
        
        return  i
    }
    
    private func indicator(_ type: HUDType) -> AnyView {
        switch type {
        case .success: return AnyView(prepareIndicator(SuccessIndicator()))
        case .failure: return AnyView(prepareIndicator(FailureIndicator()))
        case .info: return AnyView(prepareIndicator(InfoIndicator()))
            case .textOnly: return AnyView(EmptyView())
            case .waiting(let mode, let innerText):
                switch mode {
                    case .circular: return AnyView(prepareIndicator(CircularWaitingIndicator(innerText)))
                    case .linear: return AnyView(prepareIndicator(LinearWaitingIndicator(innerText)))
                }
            case .progress(let mode, let progress, let innerText):
                switch mode {
                    case .circular: return AnyView(prepareIndicator(CircularProgressIndicator(progress, text: innerText)))
                    case .linear: return AnyView(prepareIndicator(LinearProgressIndicator(progress, text: innerText)))
                }
        }
    }
    
    private var background: some View {
        Group {
            configuration?.hideBackground ?? false
                ? Color.clear
                : configuration?.backgroundColor ?? Color.gray.opacity(0.5)
        }
    }
    
    var body: some View {
        Group {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    self.indicator(self.type)
                        .padding()

                    if self.configuration?.text != nil {
                        Text(self.configuration!.text!)
                            .frame(width: geo.size.width)
                            .multilineTextAlignment(.center)
                            .lineLimit(3)
                            .foregroundColor(self.configuration?.foregroundColor ?? .white)
                            .padding(.bottom)
                    }
                }
            }
        }
        .frame(maxWidth: 170, maxHeight: 170)
        .frame(width: edgeLength, height: edgeLength)
        .background(background)
        .cornerRadius(configuration?.cornerRadius ?? 20)
        .shadow(radius: configuration?.shadowRadius ?? 5)
    }
}
