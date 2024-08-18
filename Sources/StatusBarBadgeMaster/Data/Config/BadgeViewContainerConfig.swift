//
//  BadgeViewContainerConfig.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import Foundation
import UIKit

/// Configuration for the badge container.
public struct BadgeViewContainerConfig {
    
    /// The height of the badge container.
    public var height: CGFloat
    /// The corner radius of the badge container.
    public var cornerRadius: CGFloat
    /// The background color of the badge container.
    public var backgroundColor: UIColor
    /// The left inset for the content inside the badge container.
    public var contentLeftInset: CGFloat
    /// The right inset for the content inside the badge container.
    public var contentRightInset: CGFloat
    /// The spacing between the icon and the title within the badge container.
    public var iconTitleSpacing: CGFloat
    
    /// Initializes a new badge container configuration.
    ///
    /// - Parameters:
    ///   - height: The height of the container.
    ///   - cornerRadius: The corner radius of the container.
    ///   - backgroundColor: The background color of the container.
    ///   - contentLeftInset: The left inset for the content.
    ///   - contentRightInset: The right inset for the content.
    ///   - iconTitleSpacing: The spacing between the icon and title.
    public init(
        height: CGFloat = 22,
        cornerRadius: CGFloat = 22 / 2,
        backgroundColor: UIColor = .systemBlue,
        contentLeftInset: CGFloat = 8.0,
        contentRightInset: CGFloat = -8.0,
        iconTitleSpacing: CGFloat = 8.0
    ) {
        self.height = height
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.contentLeftInset = contentLeftInset
        self.contentRightInset = contentRightInset
        self.iconTitleSpacing = iconTitleSpacing
    }
}
