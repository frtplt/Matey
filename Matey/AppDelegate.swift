//
//  AppDelegate.swift
//  Matey
//
//  Created by Firat Polat on 13.08.2022.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

      IQKeyboardManager.shared.enable = true

    // MARK: - UINavigationBar Appearance Settings
    if #available(iOS 15, *) {
        let appearance = UINavigationBarAppearance()
        let navigationBar = UINavigationBar()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
        navigationBar.standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    } else {
        let appearance = UINavigationBarAppearance()
        let navigationBar = UINavigationBar()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
        navigationBar.standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }

    // MARK: - UITabbar Appearance Settings
    if #available(iOS 15, *) {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    return true
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
      CoreDataManager.shared
  }
}

