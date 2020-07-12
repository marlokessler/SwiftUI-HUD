//
//  HUDModifier.swift
//  HUD
//
//  Created by Marlo Kessler on 11.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct HUDModifier: ViewModifier {
    
    var type: HUDType
    var show: Bool
    var configuration: HUDConfiguration?
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            ZStack {
                content
                    .blur(radius:
                        self.show
                            ? self.configuration?.blurRadius ?? 2
                            : 0
                )
                
                if self.show {
                    HUD(self.type, in: geo.size, with: self.configuration)
                }
            }
        }
    }
}
