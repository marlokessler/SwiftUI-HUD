//
//  HUDType.swift
//  SUIHUD
//
//  Created by Marlo Kessler on 07.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import Foundation

@available(iOS 13.0, *)
public enum HUDType: Equatable {
    case waiting(HUDMode, String? = nil)
    case progress(HUDMode, Double, String? = nil)
    case success
    case failure
    case info
    case textOnly
}
