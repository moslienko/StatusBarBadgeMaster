//
//  PlaygroundViewController.swift
//  StatusBarBadgeMasterExample
//
//  Created by Pavel Moslienko on 18.08.2024.
//

import UIKit
import StatusBarBadgeMaster

class PlaygroundViewController: UIViewController {
    
    var viewModel = PlaygroundViewControllerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
}

// MARK: - Module methods
private extension PlaygroundViewController {
    
    func setupView() {
        self.title = "Badge Playground"
        self.view.backgroundColor = .systemGroupedBackground
        
        let scrollView = UIScrollView()
        
        let openScreenBtn = UIButton()
        openScreenBtn.setTitle("Open screen", for: .normal)
        openScreenBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        openScreenBtn.titleLabel?.textColor = .white
        openScreenBtn.backgroundColor = .systemBlue
        openScreenBtn.layer.cornerRadius = 22.0
        openScreenBtn.addTarget(self, action: #selector(self.pushScreenButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12.0
        stackView.alignment = .leading
        stackView.distribution = .fill
        
        stackView.addArrangedSubview(self.label(text: BadgeParams.TextContent.groupName))
        stackView.addArrangedSubview(self.segment(items: BadgeParams.TextContent.allCases.map({ $0.fieldName }), selectedIndex: 0, id: BadgeParams.TextContent.id))
        
        stackView.addArrangedSubview(self.label(text: BadgeParams.IconOptions.groupName))
        stackView.addArrangedSubview(self.segment(items: BadgeParams.IconOptions.allCases.map({ $0.fieldName }), selectedIndex: 1, id: BadgeParams.IconOptions.id))
        
        stackView.addArrangedSubview(self.label(text: BadgeParams.ContainerOptions.groupName))
        stackView.addArrangedSubview(self.segment(items: BadgeParams.ContainerOptions.allCases.map({ $0.fieldName }), selectedIndex: 0, id: BadgeParams.ContainerOptions.id))
        
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        view.addSubview(openScreenBtn)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        openScreenBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: openScreenBtn.topAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            openScreenBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            openScreenBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            openScreenBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            openScreenBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

// MARK: - Components builder
private extension PlaygroundViewController {
    
    func label(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }
    
    func segment(items: [String], selectedIndex: Int, id: Int) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = selectedIndex
        segmentedControl.tag = id
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        return segmentedControl
    }
}

// MARK: - Actions
private extension PlaygroundViewController {
    
    @objc
    func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.tag {
        case BadgeParams.TextContent.id:
            guard let val = BadgeParams.TextContent(rawValue: sender.selectedSegmentIndex) else {
                return
            }
            self.viewModel.config.titleConfig.font = val.font
        case BadgeParams.IconOptions.id:
            guard let val = BadgeParams.IconOptions(rawValue: sender.selectedSegmentIndex) else {
                return
            }
            self.viewModel.badgeIcon = val.icon
        case BadgeParams.ContainerOptions.id:
            guard let val = BadgeParams.ContainerOptions(rawValue: sender.selectedSegmentIndex) else {
                return
            }
            self.viewModel.config.containerConfig.backgroundColor = val.color
        default:
            break
        }
        
        self.viewModel.updateBadge()
    }
    
    @objc
    func pushScreenButtonTapped() {
        self.navigationController?.pushViewController(ItemViewController(), animated: true)
    }
}
