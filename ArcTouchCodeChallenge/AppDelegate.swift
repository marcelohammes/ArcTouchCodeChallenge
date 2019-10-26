//
//  AppDelegate.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 19/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import RealmSwift
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    var tabBarController: TabBarController?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        tabBarController = TabBarController()
        window?.rootViewController = tabBarController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        Fabric.with([Crashlytics.self])

        Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true

        loadData()

        return true
    }

    func loadData() {
        Genre.syncList {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: FINISH_SYNC_GENRES), object: nil)
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}
