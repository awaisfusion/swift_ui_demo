import SwiftUI

/// F1 Miami Grand Prix live public chat room.
struct ChatRoomView: View {
    @Environment(\.dismiss) private var dismiss
    private let messages = ChatMessage.mockMessages

    var body: some View {
        ZStack {
            // F1 Miami track photo as full-screen background
            Image("ChatBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // Dark overlay so text stays readable
            Color.black.opacity(0.72)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                navBar
                Divider().opacity(0.15)
                messageList
                ChatInputBar()
                LiveRaceBar()
            }
        }
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)
    }

    // MARK: - Navigation bar

    private var navBar: some View {
        HStack(spacing: 10) {
            Button { dismiss() } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(9)
                    .background(Circle().fill(Color.white.opacity(0.12)))
            }

            f1Logo

            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 5) {
                    Text("F1 Miami Grand Prix")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.white)
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 13))
                        .foregroundStyle(Color(red: 0.50, green: 0.30, blue: 1.00))
                }
                HStack(spacing: 4) {
                    Circle().fill(.green).frame(width: 7, height: 7)
                    Text("Public Chat Room  ·  12.4K members")
                        .font(.system(size: 11))
                        .foregroundStyle(.white.opacity(0.50))
                }
            }

            Spacer(minLength: 0)

            Button {} label: {
                Image(systemName: "bell")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(9)
                    .background(Circle().fill(Color.white.opacity(0.12)))
            }

            Button {} label: {
                Image(systemName: "ellipsis")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(9)
                    .background(Circle().fill(Color.white.opacity(0.12)))
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
    }

    private var f1Logo: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.90, green: 0.05, blue: 0.05))
            .frame(width: 38, height: 38)
            .overlay(
                Text("F1")
                    .font(.system(size: 15, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
            )
    }

    // MARK: - Message list

    private var messageList: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(spacing: 0) {
                    PinnedBannerView()

                    ForEach(messages) { message in
                        ChatMessageRow(message: message)
                            .id(message.id)
                    }

                    TypingIndicatorView(username: "Liam")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                }
            }
            .onAppear {
                if let last = messages.last {
                    proxy.scrollTo(last.id, anchor: .bottom)
                }
            }
        }
    }
}

#Preview {
    ChatRoomView()
}
