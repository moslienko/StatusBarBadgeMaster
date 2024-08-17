//
//  ItemViewController.swift
//  StatusBarBadgeMasterExample
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import UIKit

class ItemViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        reloadData()
    }
    
    private func reloadData() {}
}

// MARK: - Setup methods
private extension ItemViewController {
    
    func setupUI() {
        self.title = "Item"
        self.view.backgroundColor = .systemGroupedBackground
    }
    
    func layoutUI() {}
}
