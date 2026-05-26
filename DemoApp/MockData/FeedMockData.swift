import SwiftUI

extension FeedPost {
    static let mockFeed: [FeedPost] = [
        FeedPost(
            username: "adventurer_joe",
            handle: "@adventurer_joe",
            isVerified: true,
            timeAgo: "2h ago",
            caption: "Chasing sunsets and good vibes.\nLife is better out here. 🌅",
            backgroundGradient: [
                Color(red: 0.28, green: 0.38, blue: 0.58),
                Color(red: 0.60, green: 0.35, blue: 0.10),
                Color(red: 0.12, green: 0.08, blue: 0.04),
                Color(red: 0.04, green: 0.04, blue: 0.07)
            ],
            likesCount: "28.7K",
            sharesCount: "1,142",
            comments: [
                FeedComment(handle: "@explorewithanna", text: "Unreal view! 🤩",            avatarColor: .pink),
                FeedComment(handle: "@hiking.daily",    text: "Added to my bucket list! 🏕", avatarColor: .green),
                FeedComment(handle: "@travelfar",       text: "Nature never disappoints. ✨", avatarColor: .orange)
            ],
            avatarColor: Color(red: 0.55, green: 0.35, blue: 0.20)
        ),
        FeedPost(
            username: "cityexplorer",
            handle: "@cityexplorer",
            isVerified: false,
            timeAgo: "5h ago",
            caption: "The city never sleeps. Neither do I. 🌃",
            backgroundGradient: [
                Color(red: 0.04, green: 0.04, blue: 0.18),
                Color(red: 0.15, green: 0.08, blue: 0.35),
                Color(red: 0.04, green: 0.02, blue: 0.10),
                Color(red: 0.00, green: 0.00, blue: 0.05)
            ],
            likesCount: "14.2K",
            sharesCount: "876",
            comments: [
                FeedComment(handle: "@nightowl",   text: "City vibes 🏙️",      avatarColor: .blue),
                FeedComment(handle: "@urban_lens", text: "Which city is this?",  avatarColor: .purple)
            ],
            avatarColor: .blue
        ),
        FeedPost(
            username: "ocean_dreamer",
            handle: "@ocean_dreamer",
            isVerified: true,
            timeAgo: "1d ago",
            caption: "The ocean heals everything. 🌊",
            backgroundGradient: [
                Color(red: 0.08, green: 0.38, blue: 0.68),
                Color(red: 0.04, green: 0.18, blue: 0.48),
                Color(red: 0.01, green: 0.08, blue: 0.28),
                Color(red: 0.00, green: 0.03, blue: 0.12)
            ],
            likesCount: "52.1K",
            sharesCount: "3,204",
            comments: [
                FeedComment(handle: "@surfer_sam", text: "Ocean is life 🏄",  avatarColor: .cyan),
                FeedComment(handle: "@wave_rider", text: "Incredible shot!",  avatarColor: .teal)
            ],
            avatarColor: .cyan
        )
    ]
}

extension FeedCategory {
    static let mockCategories: [FeedCategory] = [
        FeedCategory(title: "For You",  sfIcon: "circle.fill", emoji: ""),
        FeedCategory(title: "Trending", sfIcon: "",            emoji: "📈"),
        FeedCategory(title: "Hot Now",  sfIcon: "",            emoji: "🔥"),
        FeedCategory(title: "Music",    sfIcon: "",            emoji: "🎵"),
        FeedCategory(title: "Memes",    sfIcon: "",            emoji: "😂"),
        FeedCategory(title: "UGC",      sfIcon: "",            emoji: "📹")
    ]
}
