import SwiftUI
import DesignSystem

struct SwiftUIButtonDemo: View {
    @State var isLoading: Bool = false
    let style: BrandButtonStyle
    let isEnabled: Bool
    let title: String
    let image: ButtonImage<Image>?
    
    init(style: BrandButtonStyle = .primary(), title: String, isEnabled: Bool = true, image: ButtonImage<Image>? = nil) {
        self.style = style
        self.isEnabled = isEnabled
        self.title = title
        self.image = image
    }
    
    var body: some View {
        VStack {
            BrandButton(
                style: style,
                title: title,
                image: image,
                isLoading: $isLoading
            ) {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isLoading = false
                }
            }
        }
        .disabled(!isEnabled || isLoading)
    }
}

#Preview {
    SwiftUIButtonDemo(style: .primary(), title: "Title", isEnabled: true)
}
