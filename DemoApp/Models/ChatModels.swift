import SwiftUI

/// A single chat message in a live chat room.
struct ChatMessage: Identifiable {
    let id = UUID()
    let username: String
    let text: String
    let timestamp: String
    let avatarColor: Color
    let teamTag: TeamTag?
    let isModerator: Bool
    let reaction: ChatReaction?
    let usernameColor: Color
}

/// A coloured abbreviation tag shown next to a username (e.g. "VER", "LEC").
struct TeamTag {
    let label: String
    let color: Color
}

/// The reaction chip displayed on the trailing edge of a chat row.
enum ChatReaction {
    case heart(Int)
    case fire(Int)
    case comment(Int)

    var sfSymbol: String {
        switch self {
        case .heart:   return "heart.fill"
        case .fire:    return "flame.fill"
        case .comment: return "message"
        }
    }

    var count: Int {
        switch self {
        case .heart(let n), .fire(let n), .comment(let n): return n
        }
    }

    var tint: Color {
        switch self {
        case .heart:   return .red
        case .fire:    return .orange
        case .comment: return Color(.systemGray2)
        }
    }
}
