//
//  HUDConfiguration.swift
//  SUIHUD
//
//  Created by Marlo Kessler on 07.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI
import Indicators

@available(iOS 13.0, *)
public class HUDConfiguration {
    
    public init(
                 lineWidth: Double? = nil,
                 pace: Double? = nil,
                 innerText: String? = nil,
                 font: Font? = nil,
                 foregroundColor: Color? = nil,
                 backgroundStrokeColor: Color? = nil,
                 animated: Bool? = nil,
                 customAnimation: Animation? = nil,
                 
                 text: String? = nil,
                 cornerRadius: CGFloat? = nil,
                 shadowRadius: CGFloat? = nil,
                 backgroundColor: Color? = nil,
                 hideBackground: Bool? = nil,
                 
                 blurRadius: CGFloat? = nil
                 ) {
       
        self.lineWidth = lineWidth
        self.pace = pace
        self.innerText = innerText
        self.font = font
        self.foregroundColor = foregroundColor
        self.backgroundStrokeColor = backgroundStrokeColor
        self.animated = animated
        self.customAnimation = customAnimation
        
        self.text = text
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.backgroundColor = backgroundColor
        self.hideBackground = hideBackground
        
        self.blurRadius = blurRadius
    }
    
    
    
    // MARK: - Variables
    // Indicator
    public var lineWidth: Double?
    public var pace: Double?
    public var innerText: String?
    public var font: Font?
    public var foregroundColor: Color?
    public var backgroundStrokeColor: Color?
    public var animated: Bool?
    public var customAnimation: Animation?
    
    // HUD background
    public var text: String?
    public var cornerRadius: CGFloat?
    public var shadowRadius: CGFloat?
    public var backgroundColor: Color?
    public var hideBackground: Bool?
    
    // Underlying content
    public var blurRadius: CGFloat?
}
