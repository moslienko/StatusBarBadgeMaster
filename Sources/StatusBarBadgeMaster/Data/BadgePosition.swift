//
//  BadgePosition.swift
//  
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import Foundation

public enum BadgePosition {
    case `none`, forNotch, forIsland
    
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
