import SwiftUI

extension ChatMessage {
    static let mockMessages: [ChatMessage] = [
        ChatMessage(
            username: "MaxVerstappen33",
            text: "Let's goooo Max! 🔥",
            timestamp: "3:01:12 PM",
            avatarColor: Color(red: 0.00, green: 0.20, blue: 0.60),
            teamTag: TeamTag(label: "VER", color: Color(red: 0.00, green: 0.20, blue: 0.60)),
            isModerator: false,
            reaction: .heart(245),
            usernameColor: .white
        ),
        ChatMessage(
            username: "Leclerc16",
            text: "Come on Charles! Need that win 🥊",
            timestamp: "3:01:13 PM",
            avatarColor: Color(red: 0.80, green: 0.00, blue: 0.00),
            teamTag: TeamTag(label: "LEC", color: Color(red: 0.80, green: 0.00, blue: 0.00)),
            isModerator: false,
            reaction: .heart(112),
            usernameColor: .white
        ),
        ChatMessage(
            username: "PapayaFan",
            text: "Piastri podium today 🙌",
            timestamp: "3:01:13 PM",
            avatarColor: Color(red: 1.00, green: 0.50, blue: 0.00),
            teamTag: TeamTag(label: "NOR", color: Color(red: 1.00, green: 0.50, blue: 0.00)),
            isModerator: false,
            reaction: .fire(78),
            usernameColor: .white
        ),
        ChatMessage(
            username: "BlueFlag",
            text: "DRS zone into turn 1 👀",
            timestamp: "3:01:14 PM",
            avatarColor: Color(red: 0.20, green: 0.20, blue: 0.40),
            teamTag: nil,
            isModerator: false,
            reaction: .comment(32),
            usernameColor: .white
        ),
        ChatMessage(
            username: "FastLane",
            text: "No spoilers. Keep it clean and respectful!",
            timestamp: "3:01:15 PM",
            avatarColor: Color(red: 0.40, green: 0.20, blue: 0.80),
            teamTag: nil,
            isModerator: true,
            reaction: nil,
            usernameColor: Color(red: 0.60, green: 0.40, blue: 1.00)
        ),
        ChatMessage(
            username: "Tifosi_88",
            text: "Ferrari strategy better be on point today",
            timestamp: "3:01:15 PM",
            avatarColor: Color(red: 0.90, green: 0.10, blue: 0.10),
            teamTag: nil,
            isModerator: false,
            reaction: .comment(18),
            usernameColor: .white
        ),
        ChatMessage(
            username: "LewisHamilton",
            text: "Still we rise 🙌",
            timestamp: "3:01:15 PM",
            avatarColor: Color(red: 0.00, green: 0.50, blue: 0.30),
            teamTag: TeamTag(label: "HAM", color: Color(red: 0.00, green: 0.50, blue: 0.30)),
            isModerator: false,
            reaction: .heart(64),
            usernameColor: .white
        ),
        ChatMessage(
            username: "Sainz55",
            text: "Let's get some points today boys",
            timestamp: "3:01:16 PM",
            avatarColor: Color(red: 0.70, green: 0.00, blue: 0.00),
            teamTag: TeamTag(label: "SAI", color: Color(red: 0.70, green: 0.00, blue: 0.00)),
            isModerator: false,
            reaction: .fire(36),
            usernameColor: .white
        ),
        ChatMessage(
            username: "TracksideTom",
            text: "Overtake incoming at turn 11 👀",
            timestamp: "3:01:16 PM",
            avatarColor: Color(red: 0.80, green: 0.60, blue: 0.00),
            teamTag: nil,
            isModerator: false,
            reaction: .comment(27),
            usernameColor: Color(red: 1.00, green: 0.70, blue: 0.00)
        ),
        ChatMessage(
            username: "Velocity_Vibes",
            text: "That McLaren pace is insane",
            timestamp: "3:01:16 PM",
            avatarColor: Color(red: 0.20, green: 0.20, blue: 0.80),
            teamTag: nil,
            isModerator: false,
            reaction: .heart(91),
            usernameColor: Color(red: 0.40, green: 0.80, blue: 1.00)
        ),
        ChatMessage(
            username: "F1Fanatic",
            text: "Miami crowd is wild 🔥",
            timestamp: "3:01:17 PM",
            avatarColor: Color(red: 0.90, green: 0.40, blue: 0.00),
            teamTag: nil,
            isModerator: false,
            reaction: .fire(53),
            usernameColor: Color(red: 1.00, green: 0.50, blue: 0.00)
        )
    ]
}
