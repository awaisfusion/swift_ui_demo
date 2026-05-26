import SwiftUI

/// Main Discovery tab — vertically paged full-screen reel feed (swipe up/down).
struct DiscoveryView: View {
    @State private var selectedCategoryID = FeedCategory.mockCategories[0].id
    private let posts = FeedPost.mockFeed

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(posts) { post in
                    FeedPageView(
                        post: post,
                        selectedCategoryID: $selectedCategoryID,
                        onSearchTap: {}
                    )
                    .containerRelativeFrame([.horizontal, .vertical])
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
