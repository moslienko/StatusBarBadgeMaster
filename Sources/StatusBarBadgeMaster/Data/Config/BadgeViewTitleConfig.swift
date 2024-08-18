//
//  BadgeViewTitleConfig.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import UIKit

public struct BadgeViewTitleConfig {
    
    public var font: UIFont
    public var color: UIColor
    
    public init(
        font: UIFont = UIFont.systemFont(ofSize: 13, weight: .bold),
        color: UIColor = .white
    ) {
        self.font = font
        self.color = color
    }
}
