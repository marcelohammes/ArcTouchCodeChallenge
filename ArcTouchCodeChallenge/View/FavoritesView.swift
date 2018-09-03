//
//  FavoritesView.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 24/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit

class FavoritesView: BaseView {

    private(set) var emptyView = EmptyDataView()
    private(set) var favoritesTableView: UITableView = {
        let view = UITableView(frame: CGRect.zero)
        view.backgroundColor = R.color.white()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorInset = UIEdgeInsets.zero
        view.separatorColor = R.color.white()
        return view
    }()

    override func configureView() {
        addSubview(favoritesTableView)

        emptyView.isHidden = true
        addSubview(emptyView)
    }

    override func updateConstraints() {
        super.updateConstraints()

        favoritesTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        emptyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func showEmptyView(_ empty: Bool, searchText: String = "") {
        if empty {
            emptyView.emptyLabel.text = R.string.localizable.emptyView(searchText)
            emptyView.isHidden = false
            favoritesTableView.isHidden = true
        } else {
            emptyView.isHidden = true
            favoritesTableView.isHidden = false
        }
    }
}
