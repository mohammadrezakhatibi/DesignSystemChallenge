import SwiftUI
import DesignSystem

struct UIKitButtonDemo: UIViewControllerRepresentable {
    typealias UIViewControllerType = ButtonViewController
    let style: BrandButtonStyle
    let isEnabled: Bool
    let title: String
    let image: ButtonImage<UIImage>?
    
    init(style: BrandButtonStyle = .primary(), title: String, image: ButtonImage<UIImage>? = nil, isEnabled: Bool = true) {
        self.style = style
        self.isEnabled = isEnabled
        self.title = title
        self.image = image
    }
    
    func makeUIViewController(context: Context) -> ButtonViewController {
        ButtonViewController(style: style, title: title, image: image, isEnabled: isEnabled)
    }
    
    func updateUIViewController(_ uiViewController: ButtonViewController, context: Context) {
        uiViewController.isEnabled = isEnabled
    }
}

final class ButtonViewController: UIViewController {
    let style: BrandButtonStyle
    var isEnabled: Bool
    let buttonTitle: String
    let image: ButtonImage<UIImage>?
    
    init(style: BrandButtonStyle, title: String, image: ButtonImage<UIImage>?, isEnabled: Bool = true) {
        self.style = style
        self.isEnabled = isEnabled
        self.buttonTitle = title
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var button: BrandButtonUIKit = {
        return BrandButtonUIKit(
            style: style,
            title: buttonTitle,
            image: image
        ) { [weak self] in
            self?.button.isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self?.button.isLoading = false
            }
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = isEnabled
        let constraints = [
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
