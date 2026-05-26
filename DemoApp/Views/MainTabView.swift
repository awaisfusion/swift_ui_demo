import SwiftUI

/// Root tab bar — Discovery, Browse, Messages, Shop.
struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var showChatRoom = false

    var body: some View {
        TabView(selection: $selectedTab) {
            DiscoveryView()
                .tabItem { Label("Discovery", systemImage: "globe") }
                .tag(0)

            BrowseTab(onChatRoomTap: { showChatRoom = true })
                .tabItem { Label("Browse", systemImage: "safari") }
                .tag(1)

            PlaceholderTab(title: "Messages")
                .tabItem { Label("Messages", systemImage: "message") }
                .tag(2)

            PlaceholderTab(title: "Shop")
                .tabItem { Label("Shop", systemImage: "bag") }
                .tag(3)
        }
        .tint(.white)
        .preferredColorScheme(.dark)
        .sheet(isPresented: $showChatRoom) {
            NavigationStack {
                ChatRoomView()
            }
        }
    }
}

// MARK: - Browse tab (entry point to the Chat Room)

private struct BrowseTab: View {
    let onChatRoomTap: () -> Void

    var body: some View {
        ZStack {
            Color(red: 0.06, green: 0.06, blue: 0.09).ignoresSafeArea()

            VStack(spacing: 24) {
                Text("Browse")
                    .font(.title2.bold())
                    .foregroundStyle(.white)

                Button(action: onChatRoomTap) {
                    HStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: 0.90, green: 0.05, blue: 0.05))
                            .frame(width: 32, height: 32)
                            .overlay(
                                Text("F1")
                                    .font(.system(size: 13, weight: .black, design: .rounded))
                                    .foregroundStyle(.white)
                            )
                        Text("F1 Miami Grand Prix Chat →")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color(red: 0.50, green: 0.30, blue: 1.00))
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.white.opacity(0.07))
                    )
                }
            }
        }
    }
}

// MARK: - Generic placeholder tab

private struct PlaceholderTab: View {
    let title: String

    var body: some View {
        ZStack {
            Color(red: 0.06, green: 0.06, blue: 0.09).ignoresSafeArea()
            Text(title)
                .font(.title2.bold())
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    MainTabView()
}
