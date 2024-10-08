//
//  PlaygroundViewControllerModel.swift
//  StatusBarBadgeMasterExample
//
//  Created by Pavel Moslienko on 18.08.2024.
//

import Foundation
import StatusBarBadgeMaster
import UIKit

class PlaygroundViewControllerModel {
    
    var config = StatusBarBadgeConfig()
    var badgeIcon: UIImage? = BadgeParams.IconOptions.customAsset.icon
    
    func updateBadge() {
        StatusBarBadgeView(
            icon: badgeIcon,
            title: "App Title",
            config: config
        ).embedInWindow()
    }
}


