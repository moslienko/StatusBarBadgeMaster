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
    
    public init(
        height: CGFloat = 22,
        cornerRadius: CGFloat = 22 / 2,
        backgroundColor: UIColor = .systemBlue
    ) {
        self.height = height
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
    }
}
