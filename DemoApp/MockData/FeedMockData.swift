import SwiftUI

extension FeedPost {
    static let mockFeed: [FeedPost] = [

        // --- F1 Miami aerial drone reel
        FeedPost(
            username: "remotepilotmike",
            handle: "@remotepilotmike",
            isVerified: true,
            timeAgo: "2h ago",
            caption: "F1 Miami Grand Prix from above. 🚁🏎️\nThis view never gets old.",
            backgroundGradient: [
                Color(red: 0.08, green: 0.04, blue: 0.02),
                Color(red: 0.50, green: 0.15, blue: 0.02),
                Color(red: 0.06, green: 0.04, blue: 0.04)
            ],
            accentColor: Color(red: 0.90, green: 0.25, blue: 0.05),
            videoBundleName: "racing1",
            likesCount: "28.7K",
            sharesCount: "1,142",
            comments: [
                FeedComment(handle: "@f1fanatic",    text: "That circuit view 🔥",        avatarColor: .red),
                FeedComment(handle: "@trackday_tom", text: "Miami looks insane!",          avatarColor: .orange),
                FeedComment(handle: "@pitlane_pro",  text: "Best race of the season 🏁",  avatarColor: .yellow)
            ],
            avatarColor: Color(red: 0.85, green: 0.15, blue: 0.05)
        ),

        // --- F1 Miami Lap 1 onboard
        FeedPost(
            username: "f1miami_official",
            handle: "@f1miami_official",
            isVerified: true,
            timeAgo: "4h ago",
            caption: "Lap 1 chaos at Miami 2025. 💨\nEvery tenth counts from the start.",
            backgroundGradient: [
                Color(red: 0.02, green: 0.04, blue: 0.10),
                Color(red: 0.05, green: 0.12, blue: 0.35),
                Color(red: 0.02, green: 0.02, blue: 0.08)
            ],
            accentColor: Color(red: 0.10, green: 0.35, blue: 0.90),
            videoBundleName: "racing2",
            likesCount: "41.3K",
            sharesCount: "2,088",
            comments: [
                FeedComment(handle: "@velodrome_vids", text: "That Lap 1 start 😩",         avatarColor: .blue),
                FeedComment(handle: "@motorsport_hq",  text: "Turn 1 action was wild 💙",   avatarColor: .cyan),
                FeedComment(handle: "@laptime_lab",    text: "VER P1 again, no surprise 👑", avatarColor: .indigo)
            ],
            avatarColor: Color(red: 0.10, green: 0.35, blue: 0.90)
        ),

        // --- Tate McRae F1 aesthetic edit
        FeedPost(
            username: "tatemcrae.f1",
            handle: "@tatemcrae.f1",
            isVerified: true,
            timeAgo: "1h ago",
            caption: "Just keep watching 🎶🏎️\nThis edit hits different at 300 km/h.",
            backgroundGradient: [
                Color(red: 0.05, green: 0.02, blue: 0.12),
                Color(red: 0.20, green: 0.05, blue: 0.35),
                Color(red: 0.08, green: 0.02, blue: 0.10)
            ],
            accentColor: Color(red: 0.65, green: 0.10, blue: 0.90),
            videoBundleName: "racing3",
            likesCount: "54.1K",
            sharesCount: "3,207",
            comments: [
                FeedComment(handle: "@aesthetic_pits",  text: "Tate + F1 is everything 💜",     avatarColor: .purple),
                FeedComment(handle: "@v10_vibes",       text: "This edit is unreal 🔥",          avatarColor: .indigo),
                FeedComment(handle: "@pitwall_edits",   text: "Song choice is perfect 🎵",       avatarColor: .pink)
            ],
            avatarColor: Color(red: 0.65, green: 0.10, blue: 0.90)
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
