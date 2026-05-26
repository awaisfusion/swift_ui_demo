import SwiftUI

/// Main Discovery tab — vertically paged full-screen reel feed (swipe up/down).
struct DiscoveryView: View {
    @State private var selectedCategoryID = FeedCategory.mockCategories[0].id
    @State private var playingIndex: Int = 0

    private let posts = FeedPost.mockFeed

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(Array(posts.enumerated()), id: \.offset) { index, post in
                    FeedPageView(
                        post: post,
                        isActive: playingIndex == index,
                        selectedCategoryID: $selectedCategoryID,
                        onSearchTap: {}
                    )
                    .containerRelativeFrame([.horizontal, .vertical])
                    .id(index)
                    // Fires from the scroll view itself when ≥50% of this page is visible.
                    // Bypasses LazyVStack's pre-load timing issue entirely.
                    .onScrollVisibilityChange(threshold: 0.5) { isVisible in
                        if isVisible { playingIndex = index }
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

#Preview {
    DiscoveryView()
}
