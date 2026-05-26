import SwiftUI
import AVFoundation

/// Full-screen looping video background using AVPlayerLayer.
/// Fills the frame with .resizeAspectFill regardless of source aspect ratio.
struct VideoPlayerView: UIViewRepresentable {
    let url: URL
    let isActive: Bool  // pauses audio+video when this page is off-screen

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

    override func layoutSubviews() {
        super.layoutSubviews()
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        playerLayer?.frame = bounds
        CATransaction.commit()
    }

    func play()  { player?.play() }
    func pause() { player?.pause() }

    func configure(url: URL) {
        guard url != currentURL else { return }
        currentURL = url

        // Tear down previous
        playerLayer?.removeFromSuperlayer()
        looper = nil
        player = nil

        let item = AVPlayerItem(url: url)
        let queuePlayer = AVQueuePlayer(playerItem: item)
        queuePlayer.isMuted = false

        // AVPlayerLooper handles seamless looping
        looper = AVPlayerLooper(player: queuePlayer, templateItem: item)

        let layer = AVPlayerLayer(player: queuePlayer)
        layer.videoGravity = .resizeAspectFill
        layer.frame = bounds
        self.layer.insertSublayer(layer, at: 0)

        // Do NOT auto-play — caller controls play/pause via isActive
        player = queuePlayer
        playerLayer = layer
        backgroundColor = .black
    }

    deinit {
        looper = nil
        player = nil
    }
}
