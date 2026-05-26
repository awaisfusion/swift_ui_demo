import SwiftUI

/// Horizontally scrollable row of category filter pills with a glass effect.
struct CategoryFilterBar: View {
    let categories: [FeedCategory]
    @Binding var selectedID: UUID

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(categories) { category in
                    CategoryPill(category: category, isSelected: category.id == selectedID)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedID = category.id
                            }
                        }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

// MARK: - Pill

private struct CategoryPill: View {
    let category: FeedCategory
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 4) {
            if !category.sfIcon.isEmpty {
                Image(systemName: category.sfIcon)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.white)
            } else if !category.emoji.isEmpty {
                Text(category.emoji)
                    .font(.system(size: 12))
            }
            Text(category.title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(pillBackground)
        .overlay(pillBorder)
    }

    // MARK: - Glass background

    @ViewBuilder
    private var pillBackground: some View {
        if isSelected {
            // Bright frosted glass — selected state
            Capsule()
                .fill(.thinMaterial)
                .overlay(Capsule().fill(Color.white.opacity(0.22)))
        } else {
            // Dim frosted glass — unselected state
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(Capsule().fill(Color.white.opacity(0.06)))
        }
    }

    private var pillBorder: some View {
        Capsule()
            .stroke(
                Color.white.opacity(isSelected ? 0.60 : 0.18),
                lineWidth: isSelected ? 1.0 : 0.5
            )
    }
}

#Preview {
    @Previewable @State var selectedID = FeedCategory.mockCategories[0].id
    CategoryFilterBar(categories: FeedCategory.mockCategories, selectedID: $selectedID)
        .padding(.vertical)
        .background(
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
        )
}
