import SwiftUI

/// Circular avatar with a solid colour background and the first initial of the username.
struct AvatarView: View {
    let color: Color
    let size: CGFloat
    let initial: String

    init(color: Color, size: CGFloat = 36, username: String = "") {
        self.color = color
        self.size = size
        self.initial = String(username.prefix(1)).uppercased()
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(color)
            if !initial.isEmpty {
                Text(initial)
                    .font(.system(size: size * 0.4, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
            }
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    HStack(spacing: 12) {
        AvatarView(color: .blue,   size: 44, username: "Joe")
        AvatarView(color: .red,    size: 36, username: "Alex")
        AvatarView(color: .green,  size: 32, username: "Sam")
    }
    .padding()
    .background(Color.black)
}
