//
//  BadgeViewContainerConfig.swift
//  
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import Foundation
import UIKit

public struct BadgeViewContainerConfig {
    
    public var height: CGFloat
    public var cornerRadius: CGFloat
    public var backgroundColor: UIColor
    public var contentLeftInset: CGFloat
    public var contentRightInset: CGFloat
    public var iconTitleSpacing: CGFloat
    
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
