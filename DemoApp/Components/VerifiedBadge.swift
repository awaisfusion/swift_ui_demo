import SwiftUI

/// Blue verified-checkmark badge used next to usernames.
struct VerifiedBadge: View {
    var size: CGFloat = 14

    var body: some View {
        Image(systemName: "checkmark.seal.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue)
            .frame(width: size, height: size)
    }
}

#Preview {
    HStack {
        VerifiedBadge()
        VerifiedBadge(size: 20)
    }
    .padding()
    .background(Color.black)
}
