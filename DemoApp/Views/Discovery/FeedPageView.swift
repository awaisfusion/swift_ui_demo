import SwiftUI

/// A single full-screen reel-style page with all overlaid controls.
struct FeedPageView: View {
    let post: FeedPost
    @Binding var selectedCategoryID: UUID
    let onSearchTap: () -> Void

    // Read safe area from UIKit — GeometryReader returns 0 inside ignoresSafeArea scroll views.
    private var safeAreaTop: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.keyWindow?.safeAreaInsets.top ?? 54
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            backgroundGradient
            accentGlow
            bottomFade

            // Right-side action buttons
            FeedActionButtons(post: post)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 16)
                .padding(.bottom, 130)

            // Bottom content
            VStack(alignment: .leading, spacing: 0) {
                FeedPostOverlay(post: post)
                Spacer().frame(height: 14)
                CommentInputBar()
                Spacer().frame(height: 16)
            }
        }
        // Top controls sit just below the status bar
        .overlay(alignment: .top) {
            VStack(spacing: 6) {
                topHeader
                CategoryFilterBar(
                    categories: FeedCategory.mockCategories,
                    selectedID: $selectedCategoryID
                )
            }
            .padding(.top, safeAreaTop + 10)
        }
        // Video meta badges (duration + mute) below the top controls on right
        .overlay(alignment: .topTrailing) {
            VStack(alignment: .trailing, spacing: 8) {
                videoDurationBadge
                muteIcon
            }
            .padding(.top, safeAreaTop + 60)
            .padding(.trailing, 14)
        }
        .ignoresSafeArea()
    }

    // MARK: - Background layers

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

    private var accentGlow: some View {
        RadialGradient(
            colors: [post.accentColor.opacity(0.35), .clear],
            center: .center,
            startRadius: 40,
            endRadius: 360
        )
        .ignoresSafeArea()
    }

    private var bottomFade: some View {
        LinearGradient(
            colors: [.clear, .black.opacity(0.90)],
            startPoint: .init(x: 0.5, y: 0.30),
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }

    // MARK: - Top header bar

    private var topHeader: some View {
        HStack {
            AvatarView(
                color: Color(red: 0.55, green: 0.35, blue: 0.20),
                size: 36,
                username: "Me"
            )
            .overlay(Circle().stroke(Color.white.opacity(0.45), lineWidth: 1.5))

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

    // MARK: - Video badges

    private var videoDurationBadge: some View {
        Text(post.videoDuration)
            .font(.system(size: 12, weight: .semibold))
            .foregroundStyle(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Capsule().fill(Color.black.opacity(0.55)))
    }

    private var muteIcon: some View {
        Image(systemName: "speaker.slash.fill")
            .font(.system(size: 15, weight: .medium))
            .foregroundStyle(.white.opacity(0.75))
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
