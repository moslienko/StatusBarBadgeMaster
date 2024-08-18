//
//  StatusBarBadgeView.swift
//
//
//  Created by Pavel Moslienko on 20.06.2024.
//

import UIKit

/// A view that displays a badge view in status bar.
public class StatusBarBadgeView: UIView {
    
    // MARK: - Params
    
    /// Configuration object.
    private let config: StatusBarBadgeConfig
    
    // MARK: - UI Components
    
    /// The image view that displays the icon in the badge view.
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    /// The stack view that arranges the icon and title label.
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
        return stackView
    }()
    
    /// The label that displays the title in the badge view.
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// The container view that holds the content stack view.
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializers
    
    /// Initializes the status badge view with the specified icon, title, and configuration.
    /// - Parameters:
    ///   - icon: The icon image to display in the badge view.
    ///   - title: The title text to display in the badge view.
    ///   - config: The configuration object for customizing the appearance.
    public init(icon: UIImage?, title: String, config: StatusBarBadgeConfig = StatusBarBadgeConfig()) {
        self.config = config
        super.init(frame: .zero)
        configure(icon: icon, title: title)
        setupView()
    }
    
    override private init(frame: CGRect) {
        self.config = StatusBarBadgeConfig()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        self.config = StatusBarBadgeConfig()
        super.init(coder: coder)
        setupView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
}

// MARK: - Module public methods
public extension StatusBarBadgeView {
    
    /// Embed the status badge view in the main window.
    func embedInWindow() {
        let position = getBadgePosition()
        print("Badge position: \(position)")
        guard position != .none else { return }
        
        if let window = UIApplication.shared.windows.first {
            window.subviews.filter({ $0 is StatusBarBadgeView }).forEach({ $0.removeFromSuperview() })
            window.addSubview(self)
            
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                centerXAnchor.constraint(equalTo: window.centerXAnchor),
                topAnchor.constraint(equalTo: window.topAnchor, constant: position.insetForContainer),
                leadingAnchor.constraint(greaterThanOrEqualTo: window.leadingAnchor, constant: 16),
                trailingAnchor.constraint(lessThanOrEqualTo: window.trailingAnchor, constant: -16)
            ])
        }
    }
    
    /// Determines the badge position based on the current device's top inset.
    /// - Returns: The appropriate `BadgePosition` for the device.
    func getBadgePosition() -> BadgePosition {
        guard UIDevice.current.model.range(of: "iPhone") != nil else {
            return .none
        }
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let topInset = window?.safeAreaInsets.top ?? 0
        return BadgePosition.create(from: topInset)
    }
    
    /// Configures the status badge view with the specified icon and title.
    /// - Parameters:
    ///   - icon: The icon image to display.
    ///   - title: The title text to display.
    func configure(icon: UIImage?, title: String) {
        iconImageView.image = icon?.withRenderingMode(.alwaysTemplate)
        iconImageView.isHidden = icon == nil
        titleLabel.text = title
    }
    
    /// Shows or hides the status badge view.
    /// - Parameter isHidden: A Boolean value that determines whether the view is hidden.
    func setDisplay(isHidden: Bool) {
        self.isHidden = isHidden
    }
}

// MARK: - Actions
private extension StatusBarBadgeView {
    
    /// Handles orientation changes to update the visibility of the status badge view.
    @objc
    func orientationDidChange() {
        self.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.isHidden = !UIDevice.current.orientation.isPortrait
        }
    }
}

// MARK: - Setup methods
private extension StatusBarBadgeView {
    
    /// Set up the initial view.
    private func setupView() {
        backgroundColor = .clear
        
        contentStackView.spacing = config.containerConfig.iconTitleSpacing
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
        
        // Observe orientation changes
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationDidChange),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }
    
    /// Configures the layout constraints for the view components.
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: config.containerConfig.height),
            
            iconImageView.widthAnchor.constraint(equalToConstant: config.iconConfig.width),
            iconImageView.heightAnchor.constraint(equalToConstant: config.containerConfig.height),
            
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: config.containerConfig.contentLeftInset),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: config.containerConfig.contentRightInset),
            contentStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
}
