//
//  MainViewController.swift
//  StatusBarBadgeMasterExample
//
//  Created by Pavel Moslienko on 17.08.2024.
//

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
    }
    
    func layoutUI() {}
}
