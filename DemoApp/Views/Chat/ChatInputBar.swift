import SwiftUI

/// Message composer bar at the bottom of the chat room.
struct ChatInputBar: View {
    @State private var text = ""

    var body: some View {
        HStack(spacing: 10) {
            textField
            gifButton
            sendButton
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .background(Color(red: 0.08, green: 0.08, blue: 0.10))
    }

    // MARK: - Subviews

    private var textField: some View {
        HStack {
            TextField("Say something...", text: $text)
                .font(.system(size: 14))
                .foregroundStyle(.white)
                .tint(.white)

            Spacer(minLength: 0)

            Button {} label: {
                Image(systemName: "face.smiling")
                    .font(.system(size: 18))
                    .foregroundStyle(.white.opacity(0.60))
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 11)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white.opacity(0.10))
        )
    }

    private var gifButton: some View {
        Button {} label: {
            Text("GIF")
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(.white.opacity(0.70))
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.white.opacity(0.30), lineWidth: 1.5)
                )
        }
    }

    private var sendButton: some View {
        Button {} label: {
            Image(systemName: "paperplane.fill")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 42, height: 42)
                .background(Circle().fill(Color(red: 0.40, green: 0.20, blue: 0.85)))
        }
    }
}

#Preview {
    ChatInputBar()
        .background(Color.black)
}
