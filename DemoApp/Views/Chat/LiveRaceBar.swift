import SwiftUI

/// Live race status strip pinned to the very bottom of the chat room.
struct LiveRaceBar: View {
    var body: some View {
        HStack(spacing: 0) {
            liveIndicator
            Spacer()
            leaderInfo
            Spacer()
            timingButton
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color(red: 0.06, green: 0.06, blue: 0.09))
    }

    // MARK: - Subviews

    private var liveIndicator: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 5) {
                Circle()
                    .fill(.green)
                    .frame(width: 7, height: 7)
                Text("LIVE")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(.green)
            }
            Text("Lap 23 / 57")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.white)
        }
    }

    private var leaderInfo: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Leader")
                .font(.system(size: 11))
                .foregroundStyle(.white.opacity(0.50))
            Text("VER")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.white)
        }
    }

    private var timingButton: some View {
        Button {} label: {
            HStack(spacing: 4) {
                Text("View Live Timing")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.white)
                Image(systemName: "chevron.right")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.65))
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color.white.opacity(0.12))
            )
        }
    }
}

#Preview {
    LiveRaceBar()
        .background(Color.black)
}
