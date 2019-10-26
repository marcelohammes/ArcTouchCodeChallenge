//
//  MovieDetailViewController.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 24/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController<MovieDetailView>, MovieDetailViewDelegate {

    var movie: Movie

    init(movie: Movie) {
        self.movie = movie
        super.init()
    }

    override init() {
        fatalError("init(coder:) has not been implemented")
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = MOVIE_DETAILS_IDENTIFIER
        contentView?.delegate = self
        contentView?.setupData(movie: movie)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func favoriteButtonTouched(_ sender: FavoriteButton) {
        if movie.toogleFavorite() {
            sender.isSelected = movie.hasFavorited
        } else {
            contentView?.makeToast(R.string.localizable.cantUpdateFavorited())
        }
    }
}
