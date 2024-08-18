//
//  BadgePosition.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import Foundation

/// An enumeration representing the position of a badge on the screen.
public enum BadgePosition {
    
    /// No specific badge position.
    case `none`
    /// Badge positioned for devices with a notch.
    case forNotch
    /// Badge positioned for devices with a dynamic island.
    case forIsland
    
    /// Create a `BadgePosition` instance based on the provided top inset.
    /// - Parameter topInset: The safeAreaInsets top value.
    /// - Returns: A `BadgePosition` corresponding to the top inset value.
    static public func create(from topInset: CGFloat) -> BadgePosition {
        switch topInset {
        case 20:
            return .forNotch
        case 59:
            return .forIsland
        default:
            return .none
        }
    }
    
    /// The top inset value for positioning the badge container.
    /// - Returns: Top inset value.
    public var insetForContainer: CGFloat {
        switch self {
        case .none:
            return 0.0
        case .forNotch:
            return 5.0
        case .forIsland:
            return 20.0
        }
    }
}
