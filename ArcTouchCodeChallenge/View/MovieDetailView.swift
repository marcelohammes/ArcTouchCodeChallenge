//
//  MovieDetailView.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 24/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import SnapKit
import Cosmos

protocol MovieDetailViewDelegate: class {
    func favoriteButtonTouched(_ sender: FavoriteButton)
}

class MovieDetailView: BaseView {

    weak var delegate: MovieDetailViewDelegate!

    private(set) var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private(set) var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()

    private(set) var moviePosterImageView = UIImageView()

    private(set) var movieRatingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()

    private(set) var movieRatingLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.ratingLabel()
        return label
    }()
    
    private(set) var movieRatingView: CosmosView = {
        let movieRatingView = CosmosView()

        var settings = CosmosSettings.default
        settings.totalStars = 5
        settings.starSize = 30
        settings.fillMode = .precise
        settings.filledColor = R.color.yellow()!
        settings.emptyColor = R.color.yellow()!
        settings.emptyColor = .clear
        settings.filledBorderColor = R.color.yellow()!
        settings.updateOnTouch = false

        movieRatingView.settings = settings

        return movieRatingView
    }()

    private(set) var movieRatingSeparator = UIView()

    private(set) var movieTitleAndFavoriteButtonView = UIView()
    private(set) var movieTitleLabel = UILabel()
    private(set) var favoriteButton = FavoriteButton()

    private(set) var movieTitleBottomSeparator = UIView()

    private(set) var movieReleaseDateLabel = UILabel()

    private(set) var releaseYearBottomSeparator = UIView()

    private(set) var movieGenreLabel = UILabel()

    private(set) var genreBottomSeparator = UIView()

    private(set) var movieOverviewLabel = UILabel()

    override func configureView() {
        backgroundColor = R.color.white()

        addSubview(scrollView)

        scrollView.addSubview(stackView)

        stackView.addArrangedSubview(moviePosterImageView)

        stackView.addArrangedSubview(movieRatingStackView)
        
        movieRatingStackView.addArrangedSubview(movieRatingLabel)
        movieRatingStackView.addArrangedSubview(movieRatingView)
        
        movieRatingSeparator.backgroundColor = .lightGray
        stackView.addArrangedSubview(movieRatingSeparator)

        favoriteButton.addTarget(self, action: #selector(favoriteButtonTouched), for: .touchUpInside)
        movieTitleAndFavoriteButtonView.addSubview(movieTitleLabel)
        movieTitleAndFavoriteButtonView.addSubview(favoriteButton)
        stackView.addArrangedSubview(movieTitleAndFavoriteButtonView)

        movieTitleBottomSeparator.backgroundColor = .lightGray
        stackView.addArrangedSubview(movieTitleBottomSeparator)

        stackView.addArrangedSubview(movieReleaseDateLabel)

        releaseYearBottomSeparator.backgroundColor = .lightGray
        stackView.addArrangedSubview(releaseYearBottomSeparator)

        stackView.addArrangedSubview(movieGenreLabel)

        genreBottomSeparator.backgroundColor = .lightGray
        stackView.addArrangedSubview(genreBottomSeparator)

        movieOverviewLabel.numberOfLines = 0
        stackView.addArrangedSubview(movieOverviewLabel)
    }

    override func updateConstraints() {
        super.updateConstraints()

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }

        moviePosterImageView.snp.makeConstraints { make in
            make.height.equalTo(moviePosterImageView.snp.width).multipliedBy(0.5)
        }

        movieTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalTo(favoriteButton.snp.left).offset(8)
        }

        favoriteButton.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(movieTitleLabel.snp.right).offset(8)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }

        movieRatingSeparator.snp.makeConstraints { make in
            make.height.equalTo(1)
        }

        movieTitleBottomSeparator.snp.makeConstraints { make in
            make.height.equalTo(1)
        }

        releaseYearBottomSeparator.snp.makeConstraints { make in
            make.height.equalTo(1)
        }

        genreBottomSeparator.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }

    func setupData(movie: Movie) {
        moviePosterImageView.kf.setImage(with: movie.backdropURL)

        movieRatingView.rating = movie.voteAverage/2
        
        movieTitleLabel.text = movie.title

        favoriteButton.isSelected = movie.hasFavorited

        movieReleaseDateLabel.text = movie.releaseYear

        movieGenreLabel.text = movie.genres.map({ (genre) -> String in
            return genre.name
        }).joined(separator: ", ")

        movieOverviewLabel.text = movie.overview

        updateConstraintsIfNeeded()
    }

    @objc func favoriteButtonTouched(_ sender: FavoriteButton) {
        if let delegate = delegate {
            delegate.favoriteButtonTouched(sender)
        }
    }
}
