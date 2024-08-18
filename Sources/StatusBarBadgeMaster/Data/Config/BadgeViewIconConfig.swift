//
//  BadgeViewIconConfig.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import Foundation
import UIKit

/// Configuration for the badge icon.
public struct BadgeViewIconConfig {
    
    /// The width of the badge icon.
    public var width: CGFloat
    /// The height of the badge icon.
    public var height: CGFloat
    /// The tint color of the badge icon.
    public var tintColor: UIColor
    
    /// Initializes a new badge icon configuration.
    ///
    /// - Parameters:
    ///   - width: The width of the icon.
    ///   - height: The height of the icon.
    ///   - tintColor: The tint color of the icon.
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
