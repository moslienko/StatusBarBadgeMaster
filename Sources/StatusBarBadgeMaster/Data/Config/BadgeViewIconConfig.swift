//
//  BadgeViewIconConfig.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import Foundation
import UIKit

public struct BadgeViewIconConfig {
    
    public var width: CGFloat
    public var height: CGFloat
    public var tintColor: UIColor
    
    public init(
        width: CGFloat = 14,
        height: CGFloat = 14,
        tintColor: UIColor = .white
    ) {
        self.width = width
        self.height = height
        self.tintColor = tintColor
    }
}
