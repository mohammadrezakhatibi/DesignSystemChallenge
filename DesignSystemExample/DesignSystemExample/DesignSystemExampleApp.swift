import SwiftUI
import DesignSystem
import UIKit

@main
struct DesignSystemExampleApp: App {
    init() {
        // Register ProximaNova font
        DesignSystem.Font.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("SwiftUI")
                        .font(.title2.bold())
                    SwiftUIButtonDemo(title: "Primary")
                    
                    SwiftUIButtonDemo(title: "Primary - Disabled",
                                      isEnabled: false)
                    
                    SwiftUIButtonDemo(style: .primary(.blue),
                                      title: "Primary - Blue")
                    
                    SwiftUIButtonDemo(style: .primary(.blue),
                                      title: "Primary - Blue- Disabled",
                                      isEnabled: false)
                    
                    SwiftUIButtonDemo(style: .secondary(),
                                       title: "Secondary")
                    
                    SwiftUIButtonDemo(style: .secondary(),
                                       title: "Secondary - Disabled",
                                       isEnabled: false)
                    
                    SwiftUIButtonDemo(style: .secondary(.blue),
                                       title: "Secondary - Blue")
                    
                    SwiftUIButtonDemo(style: .secondary(.blue),
                                      title: "Secondary - Blue - Disabled",
                                      isEnabled: false)
                    
                    SwiftUIButtonDemo(style: .secondary(.blue),
                                      title: "Secondary - With Image",
                                      image: ButtonImage(image: .init(systemName: "folder")))
                    
                    SwiftUIButtonDemo(style: .secondary(),
                                      title: "Secondary - With Image on the left",
                                      image: ButtonImage(image: .init(systemName: "folder"), 
                                                         position: .trailing))
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("UIKit")
                        .font(.title2.bold())
                    UIKitButtonDemo(title: "Primary").frame(height: 44)
                    
                    UIKitButtonDemo(title: "Primary - Disabled",
                                    isEnabled: false).frame(height: 44)
                    
                    UIKitButtonDemo(style: .primary(.blue),
                                    title: "Primary - Blue").frame(height: 44)
                    
                    UIKitButtonDemo(style: .primary(.blue),
                                    title: "Primary - Blue - Disabled",
                                    isEnabled: false).frame(height: 44)
                    
                    UIKitButtonDemo(style: .secondary(),
                                    title: "Secondary").frame(height: 44)
                    
                    UIKitButtonDemo(style: .secondary(),
                                    title: "Secondary - Disabled",
                                    isEnabled: false).frame(height: 44)
                    
                    UIKitButtonDemo(style: .secondary(.blue),
                                    title: "Secondary - Blue").frame(height: 44)
                    
                    UIKitButtonDemo(style: .secondary(.blue),
                                    title: "Secondary - Blue - Disabled",
                                    isEnabled: false).frame(height: 44)
                    
                    UIKitButtonDemo(style: .secondary(.blue),
                                    title: "Secondary - With Image",
                                    image: ButtonImage(image: UIImage(systemName: "folder")!)).frame(height: 44)
                    
                    UIKitButtonDemo(style: .secondary(),
                                    title: "Secondary - With Image on the left",
                                    image: ButtonImage(image: UIImage(systemName: "folder")!, 
                                                       position: .trailing)).frame(height: 44)
                }
                .padding()
            }
        }
    }
}
