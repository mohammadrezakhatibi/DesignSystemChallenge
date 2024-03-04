import SwiftUI
import DesignSystem
import UIKit

@main
struct DesignSystemExampleApp: App {
    @State var isLoading = false
    
    init() {
        DesignSystem.Font.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("SwiftUI")
                        .font(.title2.bold())
                    BrandButtonSwiftUI(title: "Primary")
                    
                    BrandButtonSwiftUI(title: "Primary - Disabled",
                                       isEnabled: false)
                    
                    BrandButtonSwiftUI(style: .primary(.blue),
                                       title: "Primary - Blue")
                    
                    BrandButtonSwiftUI(style: .primary(.blue),
                                       title: "Primary - Blue- Disabled",
                                       isEnabled: false)
                    
                    BrandButtonSwiftUI(style: .secondary(),
                                       title: "Secondary")
                    
                    BrandButtonSwiftUI(style: .secondary(),
                                       title: "Secondary - Disabled",
                                       isEnabled: false)
                    
                    BrandButtonSwiftUI(style: .secondary(.blue),
                                       title: "Secondary - Blue")
                    
                    BrandButtonSwiftUI(style: .secondary(.blue),
                                       title: "Secondary - Blue - Disabled",
                                       isEnabled: false)
                    
                    BrandButtonSwiftUI(style: .secondary(.blue),
                                       title: "Secondary - With Image",
                                       image: ButtonImage(image: .init(systemName: "folder")))
                    
                    BrandButtonSwiftUI(style: .secondary(),
                                       title: "Secondary - With Image on the left",
                                       image: ButtonImage(image: .init(systemName: "folder"), position: .trailing))
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("UIKit")
                        .font(.title2.bold())
                    ButtonUIKit(title: "Primary").frame(height: 44)
                    
                    ButtonUIKit(title: "Primary - Disabled",
                                isEnabled: false).frame(height: 44)
                    
                    ButtonUIKit(style: .primary(.blue),
                                title: "Primary - Blue").frame(height: 44)
                    
                    ButtonUIKit(style: .primary(.blue),
                                title: "Primary - Blue - Disabled",
                                isEnabled: false).frame(height: 44)
                    
                    ButtonUIKit(style: .secondary(),
                                title: "Secondary").frame(height: 44)
                    
                    ButtonUIKit(style: .secondary(),
                                title: "Secondary - Disabled",
                                isEnabled: false).frame(height: 44)
                    
                    ButtonUIKit(style: .secondary(.blue),
                                title: "Secondary - Blue").frame(height: 44)
                    
                    ButtonUIKit(style: .secondary(.blue),
                                title: "Secondary - Blue - Disabled",
                                isEnabled: false).frame(height: 44)
                    
                    ButtonUIKit(style: .secondary(.blue),
                                title: "Secondary - With Image",
                                image: ButtonImage(image: UIImage(systemName: "folder")!)).frame(height: 44)
                    
                    ButtonUIKit(style: .secondary(),
                                title: "Secondary - With Image on the left",
                                image: ButtonImage(image: UIImage(systemName: "folder")!, position: .trailing)).frame(height: 44)
                }
                .padding()
            }
        }
    }
}

struct ButtonUIKit: UIViewControllerRepresentable {
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
