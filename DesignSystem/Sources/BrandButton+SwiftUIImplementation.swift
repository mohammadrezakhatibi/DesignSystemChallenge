import SwiftUI

public struct BrandButton: View {
    public struct ButtonImage {
        let image: Image
        let position: Position
        
        public init(image: Image, position: Position = .leading) {
            self.image = image
            self.position = position
        }
        
        public enum Position {
            case trailing
            case leading
        }
        
    }
    @Binding var isLoading: Bool
    let style: BrandButtonStyle
    let title: String
    let image: ButtonImage?
    let action: () -> Void
    
    public init(
        style: BrandButtonStyle,
        title: String,
        image: ButtonImage? = nil,
        isLoading: Binding<Bool>? = nil,
        action: @escaping () -> Void
    ) {
        self.style = style
        self.title = title
        self.image = image
        self.action = action
        self._isLoading = isLoading ?? .constant(false)
    }
    
    public var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(spacing: 12) {
                if let image = image {
                    if image.position == .leading {
                        image.image
                            .frame(width: 12, height: 12)
                        Text(title)
                    } else {
                        Text(title)
                        image.image
                            .frame(width: 12, height: 12)
                    }
                } else {
                    Text(title)
                }
            }
        })
        .isLoading(isLoading)
        .buttonStyle(style)
    }
}


#Preview {
    func buttons(_ name: String, style: BrandButtonStyle) -> some View {
        VStack(alignment: .leading) {
            Text("\(name)")
                .font(.title3.bold())
            Button("\(name)", action: {})
            Button("\(name) - disabled", action: {})
                .disabled(true)
            Button("\(name) - loading", action: {})
                .isLoading(true)
        }
        .buttonStyle(style)
        .padding(.top, 32)
    }
    
    return ScrollView {
        buttons("Primary", style: .primary())
        buttons("Primary", style: .primary(variation: .blue))
        buttons("Secondary", style: .secondary())
        buttons("Secondary", style: .secondary(variation: .blue))
    }
    .previewLayout(.fixed(width: 300, height: 100))
    .padding()
}
