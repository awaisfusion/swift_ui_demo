import SwiftUI

/// Comment composer bar pinned above the tab bar on the feed.
struct CommentInputBar: View {
    @State private var text = ""

    var body: some View {
        HStack(spacing: 10) {
            HStack {
                TextField("Say something...", text: $text)
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
                    .tint(.white)

                Spacer(minLength: 0)

                Button {} label: {
                    Image(systemName: "face.smiling")
                        .font(.system(size: 18))
                        .foregroundStyle(.white.opacity(0.65))
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 11)
            .background(Capsule().fill(Color.white.opacity(0.13)))

            Button {} label: {
                Image(systemName: "arrow.up")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(Circle().fill(Color.white.opacity(0.22)))
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CommentInputBar()
        .padding(.vertical)
        .background(Color.black)
}
