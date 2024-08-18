//
//  AppStatusBarView.swift
//
//
//  Created by Pavel Moslienko on 20.06.2024.
//

import UIKit

public class AppStatusBarView: UIView {
    
    // MARK: - Params
    private let config: AppStatusBarViewConfig
    
    // MARK: - Config
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    public init(icon: UIImage?, title: String, config: AppStatusBarViewConfig = AppStatusBarViewConfig()) {
        self.config = config
        super.init(frame: .zero)
        
        configure(icon: icon, title: title)
        setupView()
    }
    
    override private init(frame: CGRect) {
        config = AppStatusBarViewConfig()
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        config = AppStatusBarViewConfig()
        super.init(coder: coder)
        
        setupView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
}

public extension AppStatusBarView {
    
    func embedInWindows() {
        let position = getBadgePosition()
        print("hasNotch position - \(position)")
        guard position != .none else {
            return
        }
        
        let statusBarView = self
        
        if let window = UIApplication.shared.windows.first {
            window.subviews.filter({ $0 is AppStatusBarView }).forEach({ $0.removeFromSuperview() })
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
    
    func getBadgePosition() -> BadgePosition {
        guard UIDevice.current.model.range(of: "iPhone") != nil else {
            return .none
        }
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        print("safeAreaInsets - \(window?.safeAreaInsets.top)")
        let topInset = window?.safeAreaInsets.top ?? 0
        return BadgePosition.create(from: topInset)
    }
    
    func configure(icon: UIImage?, title: String) {
        iconImageView.image = icon?.withRenderingMode(.alwaysTemplate)
        iconImageView.isHidden = icon == nil
        titleLabel.text = title
    }
    
    func setDisplay(isHidden: Bool) {
        self.isHidden = isHidden
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
                
        containerView.backgroundColor = config.containerConfig.backgroundColor
        containerView.layer.cornerRadius = config.containerConfig.cornerRadius
        containerView.layer.masksToBounds = true
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = config.iconConfig.tintColor
        
        titleLabel.textAlignment = .center
        titleLabel.font = config.titleConfig.font
        titleLabel.textColor = config.titleConfig.color
        
        containerView.addSubview(contentStackView)
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
            containerView.heightAnchor.constraint(equalToConstant: config.containerConfig.height),
            
            iconImageView.widthAnchor.constraint(equalToConstant: config.iconConfig.width),
            iconImageView.heightAnchor.constraint(equalToConstant: config.containerConfig.height),
            
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            contentStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
