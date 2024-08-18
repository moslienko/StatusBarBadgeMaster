//
//  MainViewController.swift
//  StatusBarBadgeMasterExample
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import StatusBarBadgeMaster
import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        reloadData()
    }
    
    private func reloadData() {}
}

// MARK: - Setup methods
private extension MainViewController {
    
    func setupUI() {
        self.title = "Example"
        self.view.backgroundColor = .systemGroupedBackground
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            print("upd")
            AppStatusBarView(
                icon: UIImage(named: "apple_logo"),
                title: "My App Title",
                config: AppStatusBarViewConfig(containerConfig: BadgeViewContainerConfig(backgroundColor: .systemRed))
            ).embedInWindows()
        })
    }
    
    func layoutUI() {}
}
