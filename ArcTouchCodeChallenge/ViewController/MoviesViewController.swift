//
//  MoviesViewController.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 23/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import IGListKit
import Toast_Swift

class MoviesViewController: BaseViewController<MoviesView>,
                            ListAdapterDataSource,
                            IGListAdapterDelegate,
                            UISearchResultsUpdating {

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()

    var searchController: UISearchController!

    var movies = [Movie]()
    var filteredMovies = [Movie]()
    var page = 1
    var isRefreshing = true

    override func viewDidLoad() {
        super.viewDidLoad()

        contentView?.delegate = self

        setupSearchController()

        adapter.collectionView = contentView?.moviesCollectionView
        adapter.dataSource = self
        adapter.delegate = self

        getData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        adapter.reloadObjects(adapter.visibleObjects())
    }

    func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .black
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }

    func getData() {
        if page <= POPULAR_MOVIES_LIST_TOTAL_PAGES {

            if isRefreshing {
                contentView?.startSpinner()
            }

            Movie.getMovies(page: page) { (result, error) in
                self.contentView?.stopSpinner()
                if error != nil {
                    self.contentView?.showError(true)
                    self.isRefreshing = false
                    self.contentView?.refreshControl.endRefreshing()
                } else {
                    self.contentView?.showError(false)

                    if self.isRefreshing && !result.isEmpty {
                        self.movies.removeAll()
                    }

                    self.movies.append(contentsOf: result)
                    self.adapter.performUpdates(animated: true, completion: { _ in
                        self.isRefreshing = false
                        self.contentView?.refreshControl.endRefreshing()
                    })
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        if isFiltering() {
            return filteredMovies
        } else {
            return movies
        }
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = MoviesListSectionController()
        sectionController.delegate = self
        return sectionController
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

    func listAdapter(_ listAdapter: ListAdapter, willDisplay object: Any, at index: Int) {
        if !isFiltering() && index >= movies.count-6 {
            page += 1
            getData()
        }
    }

    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying object: Any, at index: Int) {

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
        filteredMovies = Movie.getFilteredMovies(byTerm: text)

        if filteredMovies.isEmpty && isFiltering() {
            self.contentView?.showEmptyView(true, searchText: text)
            return
        }

        self.contentView?.showEmptyView(false)

        adapter.performUpdates(animated: true, completion: nil)
    }
}

extension MoviesViewController: MoviesViewDelegate {
    func moviesCollectionViewRefreshed() {
        page = 1
        isRefreshing = true
        getData()
    }
}

extension MoviesViewController: MoviesListSectionControllerDelegate {
    func movieToogleFavorite(movie: Movie) {
        if movie.toogleFavorite() {
            adapter.reloadObjects([movie])
        } else {
            contentView?.makeToast(R.string.localizable.cantUpdateFavorited())
        }
    }

    func movieDidSelected(movie: Movie) {
        let movieDetailVC = MovieDetailViewController(movie: movie)
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
