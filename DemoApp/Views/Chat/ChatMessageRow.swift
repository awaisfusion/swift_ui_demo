import SwiftUI

/// A single row in the live chat feed. Renders a moderator style when flagged.
struct ChatMessageRow: View {
    let message: ChatMessage

    var body: some View {
        if message.isModerator {
            moderatorRow
        } else {
            standardRow
        }
    }

    // MARK: - Standard row

    private var standardRow: some View {
        HStack(alignment: .top, spacing: 10) {
            AvatarView(color: message.avatarColor, size: 36, username: message.username)

            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(message.username)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(message.usernameColor)

                    if let tag = message.teamTag {
                        TeamTagView(tag: tag)
                    }

                    Spacer(minLength: 0)

                    Text(message.timestamp)
                        .font(.system(size: 11))
                        .foregroundStyle(.white.opacity(0.4))
                }

                Text(message.text)
                    .font(.system(size: 14))
                    .foregroundStyle(.white.opacity(0.90))
                    .fixedSize(horizontal: false, vertical: true)
            }

            if let reaction = message.reaction {
                ReactionChip(reaction: reaction)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 7)
    }

    // MARK: - Moderator row (highlighted background)

    private var moderatorRow: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "shield.checkered")
                .font(.system(size: 20))
                .foregroundStyle(Color(red: 0.60, green: 0.40, blue: 1.00))
                .frame(width: 36)

            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(message.username)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(message.usernameColor)

                    ModBadge()

                    Spacer(minLength: 0)

                    Text(message.timestamp)
                        .font(.system(size: 11))
                        .foregroundStyle(Color(red: 0.60, green: 0.40, blue: 1.00).opacity(0.75))
                }

                Text(message.text)
                    .font(.system(size: 14))
                    .foregroundStyle(.white.opacity(0.90))
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 9)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.35, green: 0.20, blue: 0.70).opacity(0.25))
        )
        .padding(.horizontal, 12)
        .padding(.vertical, 2)
    }
}

// MARK: - Support views

private struct TeamTagView: View {
    let tag: TeamTag

    var body: some View {
        Text(tag.label)
            .font(.system(size: 10, weight: .bold))
            .foregroundStyle(.white)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Capsule().fill(tag.color))
    }
}

private struct ModBadge: View {
    var body: some View {
        Text("MOD")
            .font(.system(size: 10, weight: .bold))
            .foregroundStyle(.white)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Capsule().fill(Color(red: 0.50, green: 0.30, blue: 0.90)))
    }
}

private struct ReactionChip: View {
    let reaction: ChatReaction

    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: reaction.sfSymbol)
                .font(.system(size: 11))
                .foregroundStyle(reaction.tint)

            Text("\(reaction.count)")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.white.opacity(0.80))
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 5)
        .background(Capsule().fill(Color.white.opacity(0.08)))
    }
}

#Preview {
    VStack(spacing: 0) {
        ForEach(ChatMessage.mockMessages.prefix(5)) { msg in
            ChatMessageRow(message: msg)
        }
    }
    .background(Color.black)
}
