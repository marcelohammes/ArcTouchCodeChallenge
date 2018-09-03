//
//  MoviesListSectionController.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 23/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import IGListKit

protocol MoviesListSectionControllerDelegate: class {
    func movieDidSelected(movie: Movie)
    func movieToogleFavorite(movie: Movie)
}

class MoviesListSectionController: ListSectionController {

    var movie: Movie!
    weak var delegate: MoviesListSectionControllerDelegate!

    override init() {
        super.init()

        self.minimumLineSpacing = 20
        self.inset = .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    override  func sizeForItem(at index: Int) -> CGSize {
        return CGSize.init(width: (collectionContext!.containerSize.width-40)/2, height: 250)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let movieCell = collectionContext?.dequeueReusableCell(of: MovieCollectionViewCell.self,
                                                                     for: self,
                                                                     at: index) as? MovieCollectionViewCell else {
            fatalError()
        }

        movieCell.delegate = self
        movieCell.setup(movie: movie)

        return movieCell
    }

    override func didUpdate(to object: Any) {
        movie = object as? Movie
    }

    override func didSelectItem(at index: Int) {
        if let delegate = delegate {
            delegate.movieDidSelected(movie: movie)
        }
    }
}

extension MoviesListSectionController: MovieCollectionViewCellDelegate {
    func favoriteButtonDidTouched(cell: MovieCollectionViewCell) {
        if let delegate = delegate {
            delegate.movieToogleFavorite(movie: movie)
        }
    }
}
