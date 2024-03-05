# Design System Challenge

### Hi 👋🏼
Here are the key points about the project:

1. There is no necessary setup for running the project. Just clone and run DesignSystemChallenge.xcworkspace!
2. In the workspace, there is a package called DesignSystem and a project called DesignSystemExample.
3. The **DesignSystem** package is all about design system implementation.
3. The **DesignSystemExample** contains all demos related to the design system.
4. I tried to keep everything simple for this project and also attempted to create a platform-agnostic design system.
6. You may notice some inconsistencies in my code; this is because I tried to use different approaches to showcase my Swift knowledge.
7. Since the DesignSystem is platform-agnostic, there are two implementations of `BrandButton`, SwiftUI and UIKit.
8. Of course, there are many ways to implement a design system. I tried to keep it simple, reusable, and easy to use.
9. There are slight differences between SwiftUI and UIKit in the loading state, which can be improved in the future.

## **Diagram**
<img src="https://raw.githubusercontent.com/mohammadrezakhatibi/DesignSystemChallenge/develop/diagram.png" width="700">

## **ButtonTokens**
Button token is a basic and primitive button style like background color, text, border color, etc. Each state should have a separate token.

## **BrandButtonStyle**
BrandButtonStyle contains all button states (which are `ButtonToken`). For each button variation, I created a `BrandButtonStyle`.


## **SwiftUI's BrandButton**

**style**: The button style. See `BrandButtonStyle` documentation.<br/>
**title**: The button title.<br/>
**image**: The button image and image position.<br/>
**isLoading**: A binding parameter for handling loading state.<br/>
**action**: The button action.<br/>

```swift
BrandButton(
    style: BrandButtonStyle,
    title: String,
    image: ButtonImage<Image>? = nil,
    isLoading: Binding<Bool>? = nil,
    action: @escaping () -> Void
)
```

## **UIKit's BrandButton**

**style**: The button style. See `BrandButtonStyle` documentation.<br/>
**title**: The button title.<br/>
**image**: The button image and image position.<br/>
**action**: The button action.

```swift
BrandButtonUIKit(
    style: BrandButtonStyle, 
    title: String, 
    image: ButtonImage<UIImage>? = nil, 
    action: @escaping () -> Void
)
```

**Thank you**


## **Requirements**
* iOS 14.0+
* Xcode 15.0+


## **Installation**
There is no necessary setup for running this project. Just clone and run!


## About

**Mohammadreza Khatibi** <br />
http://mohammadreza.me <br />
mohammadrezakhatibi@outlook.com <br />