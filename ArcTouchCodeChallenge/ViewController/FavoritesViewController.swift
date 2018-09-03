//
//  FavoritesViewController.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 24/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import Reusable

class FavoritesViewController: BaseViewController<FavoritesView>,
                                UITableViewDataSource,
                                UITableViewDelegate,
                                UISearchResultsUpdating {

    var favoritesMovies = [Movie]()
    var filteredMovies = [Movie]()

    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()

        contentView?.favoritesTableView.dataSource = self
        contentView?.favoritesTableView.delegate = self

        contentView?.favoritesTableView.register(cellType: FavoriteTableViewCell.self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupSearchController()

        getData()
    }

    func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }

    func getData() {
        favoritesMovies = Movie.getFavoritesMovies()

        contentView?.favoritesTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredMovies.count
        }

        return favoritesMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as FavoriteTableViewCell

        let movie: Movie

        if isFiltering() {
            movie = filteredMovies[indexPath.row]
        } else {
            movie = favoritesMovies[indexPath.row]
        }
        cell.setup(movie: movie)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }

    func tableView(_ tableView: UITableView,
                   canPerformAction action: Selector,
                   forRowAt indexPath: IndexPath,
                   withSender sender: Any?) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let unfavoriteAction = UITableViewRowAction(style: .destructive,
                                                    title: R.string.localizable.unfavoriteButtonTitle()) { (_, indexPath) in
            let favorite = self.favoritesMovies[indexPath.row]

            if favorite.toogleFavorite() {
                self.getData()
            } else {
                self.contentView?.makeToast(R.string.localizable.cantUpdateFavorited())
            }
        }

        return [unfavoriteAction]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favoritesMovies[indexPath.row]

        let movieDetailVC = MovieDetailViewController(movie: favorite)
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
    }

    // MARK: Search
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterMovies(text: searchBar.text!)
    }

    func filterMovies(text: String) {
        filteredMovies = favoritesMovies.filter({( movie: Movie) -> Bool in
            return movie.title.lowercased().contains(text.lowercased())
        })

        if filteredMovies.isEmpty && isFiltering() {
            contentView?.showEmptyView(true, searchText: text)
        } else {
            contentView?.showEmptyView(false)
        }

        contentView?.favoritesTableView.reloadData()
    }
}
