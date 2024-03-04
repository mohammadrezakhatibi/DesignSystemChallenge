import Foundation
import SwiftUI

public struct Font {
    public enum Weight {
        case regular, bold
    }
    public let size: CGFloat
    private let weight: Weight
    private let family = "ProximaNova"
    
    private var name: String {
        switch weight {
        case .regular:
            return family+"-Regular"
        case .bold:
            return family+"-Bold"
        }
    }
    
    public init(size: CGFloat, weight: Weight) {
        self.size = size
        self.weight = weight
    }
    
    public func converter<Font>(_ mapper: (String, CGFloat) -> Font) -> Font {
        mapper(family, size)
    }
    
    public static func registerFonts() {
        ProximaNova.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
     }

    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
                  fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?

        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
