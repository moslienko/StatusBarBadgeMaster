//
//  BadgeViewTitleConfig.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import UIKit

/// Configuration for the badge title.
public struct BadgeViewTitleConfig {
    
    /// The font used for the badge title.
    public var font: UIFont
    /// The color of the badge title text.
    public var color: UIColor
    
    /// Initializes a new badge title configuration.
    ///
    /// - Parameters:
    ///   - font: The font used for the title text.
    ///   - color: The color of the title text.
    public init(
        font: UIFont = UIFont.systemFont(ofSize: 13, weight: .bold),
        color: UIColor = .white
    ) {
        self.font = font
        self.color = color
    }
}
