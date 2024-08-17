//
//  AppStatusBarView.swift
//
//
//  Created by Pavel Moslienko on 20.06.2024.
//

import UIKit

public class AppStatusBarView: UIView {
    
    private let iconImageView: UIImageView
    private let titleLabel: UILabel
    private let containerView: UIView
    
    override init(frame: CGRect) {
        iconImageView = UIImageView()
        titleLabel = UILabel()
        containerView = UIView()
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        iconImageView = UIImageView()
        titleLabel = UILabel()
        containerView = UIView()
        super.init(coder: coder)
        
        setupView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
}

public extension AppStatusBarView {
    
    static func embedInWindows() {
        let position = AppStatusBarView.getBadgePosition()
        print("hasNotch position - \(position)")
        guard position != .none else {
            return
        }
        
        let statusBarView = AppStatusBarView()
        statusBarView.configure(icon: UIImage(named: "apple_logo"), title: "App Title")
        statusBarView.translatesAutoresizingMaskIntoConstraints = false
        
        if let window = UIApplication.shared.windows.first {
            window.addSubview(statusBarView)
            
            statusBarView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                statusBarView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
                statusBarView.topAnchor.constraint(equalTo: window.topAnchor, constant: position.insetForContainer),
                statusBarView.leadingAnchor.constraint(greaterThanOrEqualTo: window.leadingAnchor, constant: 16),
                statusBarView.trailingAnchor.constraint(lessThanOrEqualTo: window.trailingAnchor, constant: -16)
            ])
        }
    }

    static func getBadgePosition() -> BadgePosition {
        guard UIDevice.current.userInterfaceIdiom == .phone else {
            return .none
        }
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        print("safeAreaInsets - \(window?.safeAreaInsets.top)")
        let topInset = window?.safeAreaInsets.top ?? 0
        return BadgePosition.create(from: topInset)
    }
    
    
    func configure(icon: UIImage?, title: String) {
        iconImageView.image = icon?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = .white
        titleLabel.text = title
    }
}

private extension AppStatusBarView {
    
    @objc
    func orientationDidChange() {
        self.isHidden = true
        DispatchQueue.main.asyncAfter(deadline:.now() + 0.3, execute: {
            self.isHidden = !UIDevice.current.orientation.isPortrait
        })
    }
}

private extension AppStatusBarView {
    
    private func setupView() {
        backgroundColor = .clear
        
        containerView.backgroundColor = .systemBlue
        containerView.layer.cornerRadius = 22 / 2
        containerView.layer.masksToBounds = true
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.tintColor = .white
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        addSubview(containerView)
        
        setupConstraints()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationDidChange),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 22),
            
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 14),
            iconImageView.heightAnchor.constraint(equalToConstant: 14),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
