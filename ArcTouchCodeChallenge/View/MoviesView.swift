//
//  MoviesView.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 23/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

protocol MoviesViewDelegate: class {
    func moviesCollectionViewRefreshed()
}

class MoviesView: BaseView {

    private(set) var errorView = ErrorDataView()
    private(set) var emptyView = EmptyDataView()
    private(set) var moviesCollectionView: ListCollectionView = {
        let collectionViewLayout = ListCollectionViewLayout(stickyHeaders: true,
                                                            topContentInset: CGFloat(0),
                                                            stretchToEdge: true)
        let view = ListCollectionView(frame: CGRect.zero, listCollectionViewLayout: collectionViewLayout)
        view.backgroundColor = R.color.white()
        return view
    }()

    var refreshControl: UIRefreshControl!
    weak var delegate: MoviesViewDelegate!

    override func configureView() {
        super.configureView()

        addSubview(moviesCollectionView)

        refreshControl = UIRefreshControl()
        refreshControl.tintColor = R.color.blue()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        moviesCollectionView.addSubview(refreshControl)

        emptyView.isHidden = true
        addSubview(emptyView)

        errorView.isHidden = true
        addSubview(errorView)
    }

    override func updateConstraints() {
        super.updateConstraints()

        moviesCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        errorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        emptyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    @objc func refreshData() {
        if let delegate = delegate {
            delegate.moviesCollectionViewRefreshed()
        }
    }

    func showEmptyView(_ empty: Bool, searchText: String = "") {
        if empty {
            emptyView.emptyLabel.text = R.string.localizable.emptyView(searchText)
            emptyView.isHidden = false
            errorView.isHidden = true
            moviesCollectionView.isHidden = true
        } else {
            emptyView.isHidden = true
            moviesCollectionView.isHidden = false
        }
    }

    func showError(_ error: Bool) {
        if error {
            errorView.isHidden = false
            emptyView.isHidden = true
            moviesCollectionView.isHidden = true
        } else {
            errorView.isHidden = true
            moviesCollectionView.isHidden = false
        }
    }

    override func startSpinner() {
        errorView.isHidden = true
        moviesCollectionView.isHidden = true
        super.startSpinner()
    }

    override func stopSpinner() {
        moviesCollectionView.isHidden = false
        super.stopSpinner()
    }
}
