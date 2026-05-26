import SwiftUI

/// Bottom-left overlay: author row, caption, and top comment previews.
struct FeedPostOverlay: View {
    let post: FeedPost

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            authorRow
            captionText
            commentPreviews
        }
        .padding(.horizontal, 16)
    }

    // MARK: - Subviews

    private var authorRow: some View {
        HStack(spacing: 8) {
            AvatarView(color: post.avatarColor, size: 36, username: post.username)
                .overlay(Circle().stroke(Color.white.opacity(0.35), lineWidth: 1.5))

            Text(post.handle)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.white)

            if post.isVerified {
                VerifiedBadge()
            }

            Text("·")
                .foregroundStyle(.white.opacity(0.6))

            Text(post.timeAgo)
                .font(.system(size: 12))
                .foregroundStyle(.white.opacity(0.6))
        }
    }

    private var captionText: some View {
        Text(post.caption)
            .font(.system(size: 15, weight: .medium))
            .foregroundStyle(.white)
            .lineSpacing(3)
            .shadow(color: .black.opacity(0.5), radius: 3)
    }

    private var commentPreviews: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(post.comments.prefix(3)) { comment in
                CommentPreviewRow(comment: comment)
            }
        }
    }
}

// MARK: - Comment preview row

private struct CommentPreviewRow: View {
    let comment: FeedComment

    var body: some View {
        HStack(spacing: 6) {
            AvatarView(color: comment.avatarColor, size: 22, username: comment.handle)

            Text("\(Text(comment.handle).bold())  \(comment.text)")
                .font(.system(size: 12))
                .foregroundStyle(.white.opacity(0.90))
                .lineLimit(1)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        FeedPostOverlay(post: FeedPost.mockFeed[0])
    }
}
