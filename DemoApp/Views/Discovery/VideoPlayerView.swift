import SwiftUI
import AVFoundation

extension Notification.Name {
    static let feedPauseAll  = Notification.Name("feedPauseAll")
    static let feedResumeActive = Notification.Name("feedResumeActive")
}

/// Full-screen looping video background using AVPlayerLayer.
/// Fills the frame with .resizeAspectFill regardless of source aspect ratio.
struct VideoPlayerView: UIViewRepresentable {
    let url: URL
    let isActive: Bool

    func makeUIView(context: Context) -> PlayerUIView {
        let view = PlayerUIView()
        view.configure(url: url)
        return view
    }

    func updateUIView(_ view: PlayerUIView, context: Context) {
        view.configure(url: url)
        isActive ? view.play() : view.pause()
    }
}

// MARK: - UIView subclass

final class PlayerUIView: UIView {
    private var player: AVQueuePlayer?
    private var looper: AVPlayerLooper?
    private var playerLayer: AVPlayerLayer?
    private var currentURL: URL?
    /// Tracks whether this player should be playing — preserved across global pause/resume.
    private var shouldBePlaying = false
    private var observers: [Any] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        let nc = NotificationCenter.default
        observers.append(nc.addObserver(forName: .feedPauseAll, object: nil, queue: .main) { [weak self] _ in
            // Pause without clearing shouldBePlaying so resume works.
            self?.player?.pause()
        })
        observers.append(nc.addObserver(forName: .feedResumeActive, object: nil, queue: .main) { [weak self] _ in
            guard let self, self.shouldBePlaying else { return }
            self.player?.play()
        })
    }

    required init?(coder: NSCoder) { fatalError() }

    override func layoutSubviews() {
        super.layoutSubviews()
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        playerLayer?.frame = bounds
        CATransaction.commit()
    }

    func play() {
        shouldBePlaying = true
        player?.play()
    }

    func pause() {
        shouldBePlaying = false
        player?.pause()
    }

    func configure(url: URL) {
        guard url != currentURL else { return }
        currentURL = url

        playerLayer?.removeFromSuperlayer()
        looper = nil
        player = nil

        let item = AVPlayerItem(url: url)
        let queuePlayer = AVQueuePlayer(playerItem: item)
        queuePlayer.isMuted = false

        looper = AVPlayerLooper(player: queuePlayer, templateItem: item)

        let layer = AVPlayerLayer(player: queuePlayer)
        layer.videoGravity = .resizeAspectFill
        layer.frame = bounds
        self.layer.insertSublayer(layer, at: 0)

        player = queuePlayer
        playerLayer = layer
        backgroundColor = .black
    }

    deinit {
        observers.forEach { NotificationCenter.default.removeObserver($0) }
        looper = nil
        player = nil
    }
}
