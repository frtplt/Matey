//
//  MainTabBarViewController.swift
//  Matey
//
//  Created by Firat Polat on 13.08.2022.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

  // MARK: - UI Elements

  // MARK: - Properties

  // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        uiInit()
    }

    // MARK: - Functions

    private func uiInit() {
        self.selectedIndex = 1
        
        self.viewControllers?[0].title = "History"
        self.viewControllers?[1].title = "Home"
        self.viewControllers?[2].title = "Profile"
        
        self.viewControllers?[0].tabBarItem.selectedImage = UIImage(systemName: "book")
        self.viewControllers?[0].tabBarItem.image = UIImage(systemName: "book")
        self.viewControllers?[1].tabBarItem.selectedImage = UIImage(systemName: "calendar")
        self.viewControllers?[1].tabBarItem.image = UIImage(systemName: "calendar")
        self.viewControllers?[2].tabBarItem.selectedImage = UIImage(named: "person")
        self.viewControllers?[2].tabBarItem.image = UIImage(named: "person")
    
        self.tabBar.tintColor = ConstantsMainTabBarVC.tabBarTintColor
        let blurEffect = UIBlurEffect(style: .dark) // here you can change blur style
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = tabBar.bounds
        blurView.autoresizingMask = .flexibleWidth
        blurView.autoresizingMask = .flexibleHeight
        tabBar.insertSubview(blurView, at: 0)
    }
}



