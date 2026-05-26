import SwiftUI

/// Main Discovery tab — vertically paged full-screen feed.
struct DiscoveryView: View {
    @State private var selectedCategoryID = FeedCategory.mockCategories[0].id
    @State private var currentIndex = 0

    private let posts = FeedPost.mockFeed

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(Array(posts.enumerated()), id: \.offset) { index, post in
                FeedPageView(
                    post: post,
                    selectedCategoryID: $selectedCategoryID,
                    onSearchTap: {}
                )
                .tag(index)
                .ignoresSafeArea()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
}

#Preview {
    DiscoveryView()
}
