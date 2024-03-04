import Foundation

public struct ButtonTokens<Image> {
    public var background: Palette
    public var text: Palette
    public var borderColor: Palette?
    public var borderWidth: CGFloat
    public var image: Image?
    
    public init(
        background: Palette,
        text: Palette,
        borderColor: Palette? = nil,
        borderWidth: CGFloat = 1,
        image: Image? = nil
    ) {
        self.background = background
        self.text = text
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.image = image
    }

}
