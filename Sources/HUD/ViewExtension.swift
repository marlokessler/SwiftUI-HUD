//
//  ViewExtension.swift
//  HUD
//
//  Created by Marlo Kessler on 11.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI


@available(iOS 13.0, *)
public extension View {
    func hud(_ type: HUDType, show: Bool, with configuration: HUDConfiguration? = nil) -> some View {
        self.modifier(HUDModifier(type: type, show: show, configuration: configuration))
    }
}
