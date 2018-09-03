//
//  MovieCollectionViewCell.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 23/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import Reusable
import SnapKit
import Kingfisher

protocol MovieCollectionViewCellDelegate: class {
    func favoriteButtonDidTouched(cell: MovieCollectionViewCell)
}

class MovieCollectionViewCell: UICollectionViewCell {

    private(set) var movieCoverImageView = UIImageView()
    private(set) var bottomView = UIView()
    private(set) var movieTitleLabel = PaddingLabel()
    private(set) var movieFavoriteButton = FavoriteButton()

    weak var delegate: MovieCollectionViewCellDelegate!

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(movie: Movie) {
        movieCoverImageView.kf.setImage(with: movie.posterURL)
        movieTitleLabel.text = movie.title

        movieFavoriteButton.isSelected = movie.hasFavorited
    }

    @objc func favoriteButtonTouched(_ sender: FavoriteButton) {
        if let delegate = delegate {
            delegate.favoriteButtonDidTouched(cell: self)
        }
    }
}

extension MovieCollectionViewCell: Reusable {

}

extension MovieCollectionViewCell: CellConfiguration {
    func setupConstraints() {
        movieCoverImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }

        bottomView.snp.makeConstraints { make in
            make.top.equalTo(movieCoverImageView.snp.bottom)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(50)
        }

        movieFavoriteButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5)
        }

        movieTitleLabel.snp.makeConstraints { make in
            make.width.equalTo(bottomView.snp.width).offset(-70)
            make.height.lessThanOrEqualToSuperview()
            make.center.equalToSuperview()
        }
    }

    func buildViewHierarchy() {
        self.contentView.addSubview(movieCoverImageView)
        self.contentView.addSubview(bottomView)

        bottomView.addSubview(movieTitleLabel)
        bottomView.addSubview(movieFavoriteButton)
    }

    func configureViews() {
        self.contentView.backgroundColor = R.color.blue()

        // MARK: Movie Cover Image
        movieCoverImageView.contentMode = .scaleToFill

        // MARK: Movie Title
        movieTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.textColor = R.color.white()
        movieTitleLabel.textAlignment = .center

        // MARK: Movie Favorite Button
        movieFavoriteButton.addTarget(self, action: #selector(favoriteButtonTouched), for: .touchUpInside)
    }
}
