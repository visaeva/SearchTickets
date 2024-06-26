
import SwiftUI

struct CustomDivider: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
    
    func style(color: Color, lineWidth: CGFloat) -> some View {
        self.stroke(color, lineWidth: lineWidth)
    }
}
