import SwiftUI

/// Animated "user is typing" indicator with bouncing dots.
struct TypingIndicatorView: View {
    let username: String
    @State private var animating = false

    var body: some View {
        HStack(spacing: 6) {
            Text("\(username) is typing...")
                .font(.system(size: 12))
                .foregroundStyle(.white.opacity(0.50))

            HStack(spacing: 4) {
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .fill(Color.white.opacity(0.50))
                        .frame(width: 5, height: 5)
                        .scaleEffect(animating ? 1.3 : 0.7)
                        .animation(
                            .easeInOut(duration: 0.45)
                                .repeatForever(autoreverses: true)
                                .delay(Double(i) * 0.15),
                            value: animating
                        )
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .onAppear { animating = true }
    }
}

#Preview {
    TypingIndicatorView(username: "Liam")
        .background(Color.black)
}
