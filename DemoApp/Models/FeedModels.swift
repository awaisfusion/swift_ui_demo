import SwiftUI

/// A single item in the discovery feed.
struct FeedPost: Identifiable {
    let id = UUID()
    let username: String
    let handle: String
    let isVerified: Bool
    let timeAgo: String
    let caption: String
    let backgroundGradient: [Color]
    let accentColor: Color       // dominant colour for overlay tinting
    let videoDuration: String    // e.g. "0:47"
    let likesCount: String
    let sharesCount: String
    let comments: [FeedComment]
    let avatarColor: Color
}

/// A preview comment shown beneath the post caption.
struct FeedComment: Identifiable {
    let id = UUID()
    let handle: String
    let text: String
    let avatarColor: Color
}

/// A discovery category filter pill.
struct FeedCategory: Identifiable {
    let id = UUID()
    let title: String
    let sfIcon: String
    let emoji: String
}
