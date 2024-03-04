import Foundation

public struct BrandButtonStyle {
    public var normal: ButtonTokens
    public var pressed: ButtonTokens
    public var disabled: ButtonTokens
    public var cornerRadius: CGFloat = 4.0
}

extension BrandButtonStyle {
    static var primary: BrandButtonStyle {
        .init(
            normal: .init(background: .green, text: .white),
            pressed: .init(background: .darkGreen, text: .white),
            disabled: .init(background: .grey, text: .white),
            cornerRadius: 4.0
        )
    }
    static var primaryBlue: BrandButtonStyle {
        .init(
            normal: .init(background: .blue, text: .white),
            pressed: .init(background: .darkBlue, text: .white),
            disabled: .init(background: .grey, text: .white),
            cornerRadius: 4.0
        )
    }
    
    static var secondary: BrandButtonStyle {
        .init(
            normal: .init(background: .white, text: .green, borderColor: .green),
            pressed: .init(background: .lightGreen, text: .green, borderColor: .green),
            disabled: .init(background: .white, text: .grey, borderColor: .grey),
            cornerRadius: 4.0
        )
    }
    
    static var secondaryBlue: BrandButtonStyle {
        .init(
            normal: .init(background: .white, text: .blue, borderColor: .blue),
            pressed: .init(background: .lightBlue, text: .blue, borderColor: .blue),
            disabled: .init(background: .white, text: .grey, borderColor: .grey),
            cornerRadius: 4.0
        )
    }
}
