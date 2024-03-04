import SwiftUI

extension BrandButtonStyle: ButtonStyle {
    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        ButtonView(style: self, configuration: configuration)
    }

    fileprivate func getValues(enabled: Bool, isPressed: Bool) -> ButtonTokens {
        guard enabled else {
            return disabled
        }

        return isPressed ? pressed : normal
    }
}

private struct ButtonView: View {
    var style: BrandButtonStyle
    var configuration: ButtonStyleConfiguration

    @Environment(\.isEnabled) var isEnabled
    @Environment(\.isLoading) var isLoading

    var values: ButtonTokens {
        style.getValues(enabled: isEnabled, isPressed: configuration.isPressed)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: style.cornerRadius)
                .fill(values.background.color)
                .frame(height: 44)
                .overlay(
                    RoundedRectangle(cornerRadius: style.cornerRadius)
                        .stroke(values.borderColor?.color ?? .clear, lineWidth: values.borderWidth)
                )

            HStack(spacing: 12) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: values.text.color))
                }
                configuration.label
                    .font(values.font.toFont)
                    .foregroundColor(values.text.color)
                    .padding([.horizontal], 8)
            }
        }
    }
}

public extension EnvironmentValues {
    var isLoading: Bool {
        get { self[IsLoadingKey.self] }
        set { self[IsLoadingKey.self] = newValue }
    }
}

public extension View {
    func isLoading(_ loading: Bool, animation: Animation = .easeInOut(duration: 0.2)) -> some View {
        environment(\.isLoading, loading)
            .animation(animation)
    }
}

private enum IsLoadingKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

private extension Font {
    var toFont: SwiftUI.Font {
        converter(SwiftUI.Font.custom(_:size:))
    }
}

private extension Palette {
    var color: Color {
        Color(hex: self.rawValue)
    }
}

