import SwiftUI

/// Main Discovery tab — vertically paged full-screen reel feed (swipe up/down).
struct DiscoveryView: View {
    @Binding var isChatOpen: Bool
    let isDiscoveryTab: Bool                      // false when user switches to another tab

    @State private var selectedCategoryID = FeedCategory.mockCategories[0].id
    @State private var playingIndex: Int = 0

    private let posts = FeedPost.mockFeed

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(Array(posts.enumerated()), id: \.offset) { index, post in
                    FeedPageView(
                        post: post,
                        isActive: playingIndex == index && !isChatOpen && isDiscoveryTab,
                        selectedCategoryID: $selectedCategoryID,
                        onSearchTap: {}
                    )
                    .containerRelativeFrame([.horizontal, .vertical])
                    .id(index)
                    .onScrollVisibilityChange(threshold: 0.5) { isVisible in
                        if isVisible { playingIndex = index }
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: isChatOpen) { _, isOpen in
            if isOpen {
                NotificationCenter.default.post(name: .feedPauseAll, object: nil)
            }
            // Resume when chat closes is handled by SwiftUI re-rendering isActive = true.
        }
        .onChange(of: isDiscoveryTab) { _, isActive in
            let name: Notification.Name = isActive ? .feedResumeActive : .feedPauseAll
            NotificationCenter.default.post(name: name, object: nil)
        }
    }
}

#Preview {
    DiscoveryView(isChatOpen: .constant(false), isDiscoveryTab: true)
}
