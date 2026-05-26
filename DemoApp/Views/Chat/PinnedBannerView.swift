import SwiftUI

private let accentPurple = Color(red: 0.60, green: 0.40, blue: 1.00)

/// Pinned race-info card with an inline "Join Voice Chat" button.
struct PinnedBannerView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            raceInfo
            Spacer()
            voiceChatButton
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.06))
        )
        .padding(.horizontal, 12)
        .padding(.top, 8)
    }

    // MARK: - Subviews

    private var raceInfo: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "pin.fill")
                .font(.system(size: 12))
                .foregroundStyle(accentPurple)

            VStack(alignment: .leading, spacing: 3) {
                Text("PINNED")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(accentPurple)

                Text("Race starts in 18:23  ·  3:00 PM EST")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white)

                HStack(spacing: 4) {
                    Text("Track temp: 52°C")
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.82))
                    Text("☀️")
                    Text("·  Sunny")
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.82))
                }
            }
        }
    }

    private var voiceChatButton: some View {
        Button {} label: {
            HStack(spacing: 6) {
                Image(systemName: "waveform")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(accentPurple)

                VStack(alignment: .leading, spacing: 2) {
                    Text("Join Voice Chat")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.white)

                    HStack(spacing: 4) {
                        Circle()
                            .fill(.green)
                            .frame(width: 5, height: 5)
                        Text("128 in voice")
                            .font(.system(size: 10))
                            .foregroundStyle(.white.opacity(0.75))
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(accentPurple, lineWidth: 1.5)
            )
        }
    }
}

#Preview {
    PinnedBannerView()
        .background(Color.black)
}
