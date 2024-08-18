//
//  AppStatusBarViewConfig.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import Foundation
import UIKit

/// Basic status badge configuration.
public struct AppStatusBarViewConfig {
    
    /// Configuration for the badge container.
    public var containerConfig: BadgeViewContainerConfig
    /// Configuration for the badge icon.
    public var iconConfig: BadgeViewIconConfig
    /// Configuration for the badge title.
    public var titleConfig: BadgeViewTitleConfig
    
    /// Initializes a new configuration for the status badge view.
    /// - Parameters:
    ///   - containerConfig: Configuration for the badge container
    ///   - iconConfig: Configuration for the badge icon.
    ///   - titleConfig: Configuration for the badge title.
    public init(
        containerConfig: BadgeViewContainerConfig = BadgeViewContainerConfig(),
        iconConfig: BadgeViewIconConfig = BadgeViewIconConfig(),
        titleConfig: BadgeViewTitleConfig = BadgeViewTitleConfig()
    ) {
        self.containerConfig = containerConfig
        self.iconConfig = iconConfig
        self.titleConfig = titleConfig
    }
}
