//
//  StatusBarBadgeConfig.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import Foundation
import UIKit

/// Basic status badge configuration.
public struct StatusBarBadgeConfig {
    
    /// Configuration for the badge container.
    public var containerConfig: StatusBarBadgeContainerConfig
    /// Configuration for the badge icon.
    public var iconConfig: StatusBarBadgeIconConfig
    /// Configuration for the badge title.
    public var titleConfig: StatusBarBadgeTitleConfig
    
    /// Initializes a new configuration for the status badge view.
    /// - Parameters:
    ///   - containerConfig: Configuration for the badge container
    ///   - iconConfig: Configuration for the badge icon.
    ///   - titleConfig: Configuration for the badge title.
    public init(
        containerConfig: StatusBarBadgeContainerConfig = StatusBarBadgeContainerConfig(),
        iconConfig: StatusBarBadgeIconConfig = StatusBarBadgeIconConfig(),
        titleConfig: StatusBarBadgeTitleConfig = StatusBarBadgeTitleConfig()
    ) {
        self.containerConfig = containerConfig
        self.iconConfig = iconConfig
        self.titleConfig = titleConfig
    }
}
