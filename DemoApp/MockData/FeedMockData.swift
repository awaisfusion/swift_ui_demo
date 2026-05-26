import SwiftUI

extension FeedPost {
    static let mockFeed: [FeedPost] = [

        // --- Post 1: Sunset hike (warm golden landscape)
        FeedPost(
            username: "adventurer_joe",
            handle: "@adventurer_joe",
            isVerified: true,
            timeAgo: "2h ago",
            caption: "Chasing sunsets and good vibes.\nLife is better out here. 🌅",
            backgroundGradient: [
                Color(red: 0.18, green: 0.28, blue: 0.52),   // deep sky blue
                Color(red: 0.55, green: 0.30, blue: 0.08),   // burnt orange
                Color(red: 0.72, green: 0.42, blue: 0.05),   // golden
                Color(red: 0.22, green: 0.12, blue: 0.04),   // dark earth
                Color(red: 0.06, green: 0.06, blue: 0.10)    // near black
            ],
            accentColor: Color(red: 0.72, green: 0.42, blue: 0.05),
            videoDuration: "0:47",
            likesCount: "28.7K",
            sharesCount: "1,142",
            comments: [
                FeedComment(handle: "@explorewithanna", text: "Unreal view! 🤩",            avatarColor: .pink),
                FeedComment(handle: "@hiking.daily",    text: "Added to my bucket list! 🏕", avatarColor: .green),
                FeedComment(handle: "@travelfar",       text: "Nature never disappoints. ✨", avatarColor: .orange)
            ],
            avatarColor: Color(red: 0.55, green: 0.35, blue: 0.20)
        ),

        // --- Post 2: Ocean / surf reel (cool blues & teals)
        FeedPost(
            username: "wave_rider",
            handle: "@wave_rider",
            isVerified: true,
            timeAgo: "4h ago",
            caption: "Nothing beats a morning session. 🏄‍♂️\nThe ocean never gets old.",
            backgroundGradient: [
                Color(red: 0.04, green: 0.18, blue: 0.45),   // deep sea
                Color(red: 0.05, green: 0.40, blue: 0.62),   // ocean blue
                Color(red: 0.10, green: 0.62, blue: 0.68),   // teal surf
                Color(red: 0.03, green: 0.22, blue: 0.38),   // mid-water
                Color(red: 0.01, green: 0.06, blue: 0.14)    // deep
            ],
            accentColor: Color(red: 0.10, green: 0.62, blue: 0.68),
            videoDuration: "1:03",
            likesCount: "52.1K",
            sharesCount: "3,204",
            comments: [
                FeedComment(handle: "@surfer_sam",  text: "Ocean is life 🏄",   avatarColor: .cyan),
                FeedComment(handle: "@beach_vibes", text: "Which spot is this?", avatarColor: .teal),
                FeedComment(handle: "@saltyhair",   text: "Goals 🌊",            avatarColor: .blue)
            ],
            avatarColor: .cyan
        ),

        // --- Post 3: City night-life (neon purples & city lights)
        FeedPost(
            username: "cityexplorer",
            handle: "@cityexplorer",
            isVerified: false,
            timeAgo: "5h ago",
            caption: "The city never sleeps. Neither do I. 🌃\nNeon everything.",
            backgroundGradient: [
                Color(red: 0.04, green: 0.02, blue: 0.12),   // deep night
                Color(red: 0.18, green: 0.06, blue: 0.38),   // dark purple
                Color(red: 0.50, green: 0.10, blue: 0.70),   // neon purple
                Color(red: 0.15, green: 0.04, blue: 0.28),   // mid night
                Color(red: 0.02, green: 0.01, blue: 0.08)    // black
            ],
            accentColor: Color(red: 0.50, green: 0.10, blue: 0.70),
            videoDuration: "0:34",
            likesCount: "14.2K",
            sharesCount: "876",
            comments: [
                FeedComment(handle: "@nightowl",   text: "City vibes 🏙️",       avatarColor: .blue),
                FeedComment(handle: "@urban_lens", text: "Which city is this?",  avatarColor: .purple),
                FeedComment(handle: "@neonchaser", text: "The lights omg 😍",    avatarColor: .indigo)
            ],
            avatarColor: .purple
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
