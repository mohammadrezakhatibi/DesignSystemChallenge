import Foundation

public struct ButtonTokens {
    public var background: Palette
    public var text: Palette
    public var borderColor: Palette?
    public var borderWidth: CGFloat
    
    public init(
        background: Palette,
        text: Palette,
        borderColor: Palette? = nil,
        borderWidth: CGFloat = 1,
    ) {
        self.background = background
        self.text = text
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }

}
