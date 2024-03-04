public struct ButtonImage<Image> {
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
