import SwiftUI

/// Horizontally scrollable row of category filter pills.
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
                    .foregroundStyle(isSelected ? .black : .white)
            } else if !category.emoji.isEmpty {
                Text(category.emoji)
                    .font(.system(size: 12))
            }
            Text(category.title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(isSelected ? .black : .white)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(isSelected ? Color.white : Color.white.opacity(0.18))
        )
    }
}

#Preview {
    @Previewable @State var selectedID = FeedCategory.mockCategories[0].id
    CategoryFilterBar(categories: FeedCategory.mockCategories, selectedID: $selectedID)
        .padding(.vertical)
        .background(Color.black)
}
