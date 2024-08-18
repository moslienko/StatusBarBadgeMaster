//
//  BadgeParams.swift
//  StatusBarBadgeMasterExample
//
//  Created by Pavel Moslienko on 18.08.2024.
//

import Foundation
import UIKit

protocol BadgeParamsSegment {
    static var id: Int { get }
    static var groupName: String { get }
    var fieldName: String { get }
}

enum BadgeParams {
    
    enum TextContent: Int, CaseIterable, BadgeParamsSegment {
        case bold = 0
        case heavy = 1
        case black = 2
        
        static var id: Int = 101
        static var groupName: String = "Title Font"
        
        var fieldName: String {
            switch self {
            case .bold:
                return "Bold"
            case .heavy:
                return "Heavy"
            case .black:
                return "Black"
            }
        }
        
        var font: UIFont {
            switch self {
            case .bold:
                return UIFont.systemFont(ofSize: 13, weight: .bold)
            case .heavy:
                return UIFont.systemFont(ofSize: 13, weight: .heavy)
            case .black:
                return UIFont.systemFont(ofSize: 13, weight: .black)
            }
        }
    }
    
    enum IconOptions: Int, CaseIterable, BadgeParamsSegment {
        case none = 0
        case customAsset = 1
        case sfAsset = 2
        
        static var id: Int = 102
        static var groupName: String = "Icon Options"
        
        var fieldName: String {
            switch self {
            case .none:
                return "Without"
            case .customAsset:
                return "Custom Asset"
            case .sfAsset:
                return "SF Symbol"
            }
        }
        
        var icon: UIImage? {
            switch self {
            case .none:
                return nil
            case .customAsset:
                return UIImage(named: "apple_logo")
            case .sfAsset:
                return UIImage(systemName: "gift")
            }
        }
    }
    
    enum ContainerOptions: Int, CaseIterable, BadgeParamsSegment {
        case blue = 0
        case red = 1
        case purple = 2
        
        static var id: Int = 106
        static var groupName: String = "Container style"
        
        var fieldName: String {
            switch self {
            case .blue:
                return "Blue"
            case .red:
                return "Red"
            case .purple:
                return "Purple"
            }
        }
        
        var color: UIColor {
            switch self {
            case .blue:
                return .systemBlue
            case .red:
                return .systemRed
            case .purple:
                return .systemPurple
            }
        }
    }
}
