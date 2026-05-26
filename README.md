# DemoApp — SwiftUI Demo Project

Delivered by **Fusionwave** as a client demo showcasing two fully interactive screens built in SwiftUI for iOS.

---

## Screens

### 1. Discovery Feed
An Instagram Reels-style vertical paging feed.

- Full-screen video playback with seamless looping (AVQueuePlayer + AVPlayerLooper)
- Swipe up/down to page between posts
- Audio plays only on the active video — pauses automatically when switching videos, tabs, or opening chat
- Category filter bar with glass-pill effect
- Per-post action buttons (like with spring animation, share)
- Comment preview overlay, "Say something…" input bar
- Gradient fallback for posts without video

### 2. F1 Miami Grand Prix Live Chat Room
A real-time-style sports chat room.

- F1 Miami sunset track photo as full-screen background
- Pinned race info banner with "Join Voice Chat" button
- Live chat messages with team tags (VER, LEC, NOR, HAM, SAI), reaction chips, and timestamps
- Moderator message row with highlighted background
- Animated typing indicator ("Liam is typing…")
- Live race bar (Lap 23/57 · Leader VER · View Live Timing)
- Message input bar with emoji, GIF, and send button

---

## Technical Highlights

| Requirement | Implementation |
|---|---|
| iOS 16+ target | `ScrollView` + `.scrollTargetBehavior(.paging)` for vertical feed |
| No hardcoded widths | `.containerRelativeFrame`, `.frame(maxWidth: .infinity)` throughout |
| `#Preview` blocks | Every view has a working `#Preview` |
| SF Symbols | Used for all icons (magnifyingglass, heart.fill, paperplane.fill, etc.) |
| Modular architecture | One file per component, Models / MockData / Views / Components folders |
| Mock data | `FeedPost.mockFeed`, `ChatMessage.mockMessages` — easy to swap for real API |
| Video assets | 3 bundled MP4s in `Resources/Videos/` (racing1–3.mp4) |
| Chat background | F1 Miami photo in `Assets.xcassets/ChatBackground.imageset` |

---

## Project Structure

```
DemoApp/
├── DemoApp.xcodeproj
└── DemoApp/
    ├── Assets.xcassets/          # App icon + ChatBackground image
    ├── Resources/
    │   └── Videos/               # racing1.mp4, racing2.mp4, racing3.mp4
    ├── Models/
    │   ├── FeedModels.swift       # FeedPost, FeedComment, FeedCategory
    │   └── ChatModels.swift       # ChatMessage, TeamTag, ChatReaction
    ├── MockData/
    │   ├── FeedMockData.swift     # 3 mock feed posts
    │   └── ChatMockData.swift     # 9 mock chat messages
    ├── Components/
    │   ├── AvatarView.swift
    │   └── VerifiedBadge.swift
    └── Views/
        ├── MainTabView.swift      # Root tab bar (Discovery, Browse, Messages, Shop)
        ├── ContentView.swift
        ├── Discovery/
        │   ├── DiscoveryView.swift
        │   ├── FeedPageView.swift
        │   ├── VideoPlayerView.swift
        │   ├── FeedPostOverlay.swift
        │   ├── FeedActionButtons.swift
        │   ├── CategoryFilterBar.swift
        │   └── CommentInputBar.swift
        └── Chat/
            ├── ChatRoomView.swift
            ├── ChatMessageRow.swift
            ├── ChatInputBar.swift
            ├── PinnedBannerView.swift
            ├── LiveRaceBar.swift
            └── TypingIndicatorView.swift
```

---

## Requirements

- Xcode 15 or later
- iOS 18+ device or simulator (uses `.onScrollVisibilityChange`, `.onScrollGeometryChange`)
- No third-party dependencies — 100% SwiftUI + AVFoundation

## Running the App

1. Open `DemoApp.xcodeproj` in Xcode
2. Select a simulator or connected device
3. Press `Cmd+R`

To run on a physical device, set your Apple Developer Team under:
**Target → Signing & Capabilities → Team**

---

*Built by Fusionwave · 2025*
