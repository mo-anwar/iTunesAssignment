//
//  ResultDetailsViewController.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/12/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit
import AVKit

// MARK: View
class ResultDetailsViewController: UIViewController {
    
    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var trackNameLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var copyRightsLabel: UILabel!
    @IBOutlet private weak var primaryGenreNameLabel: UILabel!
    @IBOutlet private weak var playButton: UIButton!

    private var model: SearchModel.ViewModel.Result
    
    init(model: SearchModel.ViewModel.Result) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(model: model)
    }
    
    func configure(model: SearchModel.ViewModel.Result) {
        previewImageView.load(url: URL(string: model.artworkUrl100))
        trackNameLabel.text = model.trackName ?? model.collectionName ?? ""
        artistNameLabel.text = model.artistName
        copyRightsLabel.text = model.copyright
        descriptionLabel.text = model.longDescription
        primaryGenreNameLabel.text = model.primaryGenreName
        if model.previewUrl != nil {
            playButton.isHidden = false
        }
    }
    
    @IBAction private func didTapPlayButton(_ sender: UIButton) {
        if let previewUrl = model.previewUrl, let url = URL(string: previewUrl) {
            let player = AVPlayer(url: url)
            let avPlayerViewController = AVPlayerViewController()
            avPlayerViewController.player = player
            present(avPlayerViewController, animated: true) { avPlayerViewController.player?.play() }
        }
    }
}
