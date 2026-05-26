import SwiftUI

/// Vertical stack of like / share action buttons on the right side of a feed post.
struct FeedActionButtons: View {
    let post: FeedPost
    @State private var isLiked = false

    var body: some View {
        VStack(spacing: 22) {
            ActionButton(
                icon: isLiked ? "heart.fill" : "heart",
                label: post.likesCount,
                tint: isLiked ? .red : .white
            )
            .onTapGesture {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    isLiked.toggle()
                }
            }

            ActionButton(icon: "arrowshape.turn.up.right", label: post.sharesCount, tint: .white)
        }
    }
}

// MARK: - Single button

private struct ActionButton: View {
    let icon: String
    let label: String
    let tint: Color

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(tint)
                .shadow(color: .black.opacity(0.4), radius: 4, y: 2)
            Text(label)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
    }
}

#Preview {
    FeedActionButtons(post: FeedPost.mockFeed[0])
        .padding()
        .background(Color.black)
}
