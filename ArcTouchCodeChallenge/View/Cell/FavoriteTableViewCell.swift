//
//  FavoriteTableViewCell.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 24/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import Reusable

class FavoriteTableViewCell: UITableViewCell {

    private(set) var movieCoverImageView = UIImageView()
    private(set) var movieTitleLabel = UILabel()
    private(set) var movieReleaseDateLabel = UILabel()
    private(set) var movieOverviewLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        movieReleaseDateLabel.text = movie.releaseYear
        movieOverviewLabel.text = movie.overview
    }
}

extension FavoriteTableViewCell: Reusable {

}

extension FavoriteTableViewCell: CellConfiguration {
    func setupConstraints() {
        movieCoverImageView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.left.equalToSuperview()
            maker.width.equalTo(movieCoverImageView.snp.height).multipliedBy(0.66)
        }

        movieTitleLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(movieCoverImageView.snp.right).offset(16)
            maker.top.equalToSuperview().offset(16)
            maker.right.equalTo(movieReleaseDateLabel.snp.left)
        }

        movieReleaseDateLabel.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview().offset(-16)
            maker.top.equalTo(movieTitleLabel.snp.top)
            maker.width.equalTo(40)
        }

        movieOverviewLabel.snp.makeConstraints { (maker) in
            maker.leading.equalTo(movieTitleLabel.snp.leading)
            maker.top.greaterThanOrEqualTo(movieTitleLabel.snp.bottom)
            maker.bottom.equalToSuperview().offset(-16)
            maker.trailing.equalTo(movieReleaseDateLabel.snp.trailing)
        }
    }

    func buildViewHierarchy() {
        addSubview(movieCoverImageView)
        addSubview(movieTitleLabel)
        addSubview(movieReleaseDateLabel)
        addSubview(movieOverviewLabel)
    }

    func configureViews() {
        backgroundColor = .lightGray

        movieTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        movieReleaseDateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        movieOverviewLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)

        movieOverviewLabel.numberOfLines = 3

        movieReleaseDateLabel.textAlignment = .right
    }

}
