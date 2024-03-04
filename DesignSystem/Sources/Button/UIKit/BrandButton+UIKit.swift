import Foundation
import UIKit

/// BrandButtonUIKit.
///
/// - Note: This is the UIKit implementation for `BrandButton`.
///         for SwiftUI use `BrandButton`
///
/// - Parameters:
///   - style: The button style. See `BrandButtonStyle` documentation.
///   - title: The button title.
///   - image: The button image and image position.
///   - action: The button action.
public final class BrandButtonUIKit: UIButton {
    private var style: BrandButtonStyle
    private var image: ButtonImage<UIImage>?
    
    private var spinner = UIActivityIndicatorView()
    private var values: ButtonTokens {
        guard isEnabled else {
            return style.disabled
        }

        return isHighlighted ? style.pressed : style.normal
    }
    
    public var isLoading: Bool = false {
        didSet {
            showSpinner()
            updateView()
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            updateView()
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            updateView()
        }
    }
    
    public init(style: BrandButtonStyle, title: String, image: ButtonImage<UIImage>? = nil, action: @escaping () -> Void) {
        self.style = style
        self.image = image
        super.init(frame: .zero)
        
        addAction(UIAction { _ in
            action()
        }, for: .touchUpInside)
        
        appearanceView(with: title)
        
        setupSpinner()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func showSpinner() {
        let image = imageView?.image
        if isLoading {
            spinner.startAnimating()
            setImage(nil, for: .normal)
            // to prevent multiple click while in process
            isEnabled = false
        } else {
            spinner.stopAnimating()
            setImage(image, for: .normal)
            isEnabled = true
        }
    }
    
    private func updateView() {
        imageView?.tintColor = values.text.uiColor
        setTitleColor(values.text.uiColor, for: .normal)
        setTitleColor(values.text.uiColor, for: .highlighted)
        setTitleColor(values.text.uiColor, for: .disabled)
        layer.borderColor = values.borderColor?.uiColor.cgColor ?? UIColor.clear.cgColor
        backgroundColor = values.background.uiColor
        spinner.color = values.text.uiColor
    }
    
    private func appearanceView(with title: String) {
        // Appearance button
        contentEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
        backgroundColor = values.background.uiColor
        layer.cornerRadius = style.cornerRadius
        layer.borderColor = values.borderColor?.uiColor.cgColor ?? UIColor.clear.cgColor
        layer.borderWidth = values.borderWidth
        
        // Appearance label
        setTitle(title, for: .normal)
        setTitleColor(values.text.uiColor, for: .normal)
        titleLabel?.font = values.font.converter(UIFont.init(name:size:))
        
        // Appearance imageView
        setImage(image?.image, for: .normal)
        imageView?.tintColor = values.text.uiColor
        imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 12)
        imageView?.contentMode = .scaleAspectFit
        imageView?.tintColor = values.text.uiColor
        
        if image?.position == .trailing {
            transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        }
    }
    
    private func setupSpinner() {
        addSubview(spinner)
        spinner.color = values.text.uiColor
        spinner.translatesAutoresizingMaskIntoConstraints = false
        let constraint = [
            spinner.trailingAnchor.constraint(equalTo: titleLabel?.leadingAnchor ?? leadingAnchor, constant: -16),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.widthAnchor.constraint(equalToConstant: 24),
        ]
        NSLayoutConstraint.activate(constraint)
    }
}

private extension Palette {
    var uiColor: UIColor {
        UIColor(hex: self.rawValue)
    }
}

private extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexValue = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

