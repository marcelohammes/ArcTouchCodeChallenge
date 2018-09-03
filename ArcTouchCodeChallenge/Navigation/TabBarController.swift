//
//  TabBarController.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 20/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    lazy public var moviesTabBar: MoviesViewController = {

        let moviesTabBar = MoviesViewController()

        let title = R.string.localizable.moviesTitle()

        let defaultImage = R.image.list_icon()

        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: defaultImage)

        moviesTabBar.tabBarItem = tabBarItem

        return moviesTabBar
    }()

    lazy public var favoritesTabBar: FavoritesViewController = {

        let favoritesTabBar = FavoritesViewController()

        let title = R.string.localizable.favoritesTitle()

        let defaultImage = R.image.favorite_empty_icon()

        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: defaultImage)

        favoritesTabBar.tabBarItem = tabBarItem

        return favoritesTabBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.barTintColor = R.color.orange()
        tabBar.tintColor = R.color.blue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let viewControllers = [moviesTabBar, favoritesTabBar]

        self.viewControllers = viewControllers.map { UINavigationController(rootViewController: $0)}
    }
}

extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }

}
