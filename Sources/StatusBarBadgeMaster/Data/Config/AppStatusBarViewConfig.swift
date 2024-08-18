//
//  AppStatusBarViewConfig.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import Foundation
import UIKit

/// Basic status basge config
public struct AppStatusBarViewConfig {
    
    public var containerConfig: BadgeViewContainerConfig
    public var iconConfig: BadgeViewIconConfig
    public var titleConfig: BadgeViewTitleConfig
    
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
