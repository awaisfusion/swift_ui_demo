import SwiftUI

/// A single full-screen feed post with all overlaid controls.
struct FeedPageView: View {
    let post: FeedPost
    @Binding var selectedCategoryID: UUID
    let onSearchTap: () -> Void

    var body: some View {
        ZStack(alignment: .bottom) {
            backgroundGradient
            bottomFade

            // Right-side action buttons
            FeedActionButtons(post: post)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 16)
                .padding(.bottom, 120)

            // Bottom content: user info, comments, input bar
            VStack(alignment: .leading, spacing: 0) {
                FeedPostOverlay(post: post)
                Spacer().frame(height: 14)
                CommentInputBar()
                Spacer().frame(height: 16)
            }
        }
        // Top controls float above the image
        .overlay(alignment: .top) {
            VStack(spacing: 6) {
                topHeaderBar
                CategoryFilterBar(
                    categories: FeedCategory.mockCategories,
                    selectedID: $selectedCategoryID
                )
            }
            .padding(.top, 8)
        }
    }

    // MARK: - Background

    private var backgroundGradient: some View {
        let stops = post.backgroundGradient.enumerated().map { idx, color in
            Gradient.Stop(
                color: color,
                location: Double(idx) / Double(max(post.backgroundGradient.count - 1, 1))
            )
        }
        return LinearGradient(stops: stops, startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }

    private var bottomFade: some View {
        LinearGradient(
            colors: [.clear, .black.opacity(0.88)],
            startPoint: .center,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }

    // MARK: - Top header

    private var topHeaderBar: some View {
        HStack {
            AvatarView(color: Color(red: 0.55, green: 0.35, blue: 0.20), size: 36, username: "Me")
                .overlay(Circle().stroke(Color.white.opacity(0.4), lineWidth: 1.5))

            Spacer()

            Button(action: onSearchTap) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(9)
                    .background(Circle().fill(Color.white.opacity(0.18)))
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    @Previewable @State var selectedID = FeedCategory.mockCategories[0].id
    FeedPageView(
        post: FeedPost.mockFeed[0],
        selectedCategoryID: $selectedID,
        onSearchTap: {}
    )
}
