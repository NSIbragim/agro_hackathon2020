//
//  AppDelegate.swift
//  marsianStrawberry
//
//  Created by i.mamadaev on 11.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let firstVC = FirstViewController()
//
//        firstVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 1)
//
//        let secondVC = SecondViewController()
//
//        secondVC.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.dash"), tag: 2)
//
//        let thirdVC = ThirdViewController()
//
//        thirdVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis"), tag: 3)
        
        let mainVC = GHTableViewController()
        
        mainVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house")?.withTintColor(UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1)).withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "house.fill")?.withTintColor(UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1)).withRenderingMode(.alwaysOriginal)
        )
        
        let notificationsVC = NotificationsViewController()
        
        notificationsVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "bell")?.withTintColor(UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1)).withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "bell.fill")?.withTintColor(UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1)).withRenderingMode(.alwaysOriginal)
        )
        
        let profileVC = ProfileViewController()
        
        profileVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person")?.withTintColor(UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1)).withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "person.fill")?.withTintColor(UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1)).withRenderingMode(.alwaysOriginal)
        )
        
        let tabBarController = UITabBarController()
        
        let mainNC = UINavigationController(rootViewController: mainVC)
        
        mainNC.navigationBar.barTintColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        mainNC.navigationBar.tintColor = .white
        mainNC.navigationBar.barStyle = .black
        mainNC.navigationBar.isTranslucent = false
        
        let notificationsNC = UINavigationController(rootViewController: notificationsVC)
        
        notificationsNC.navigationBar.barTintColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        notificationsNC.navigationBar.tintColor = .white
        notificationsNC.navigationBar.barStyle = .black
        notificationsNC.navigationBar.shadowImage = UIImage()
        notificationsNC.navigationBar.isTranslucent = false
        
        let profileNC = UINavigationController(rootViewController: profileVC)
        
        profileNC.navigationBar.barTintColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        profileNC.navigationBar.tintColor = .white
        profileNC.navigationBar.barStyle = .black
        profileNC.navigationBar.shadowImage = UIImage()
        profileNC.navigationBar.isTranslucent = false
        
        tabBarController.setViewControllers([mainNC, notificationsNC, profileNC], animated: false)
        
        tabBarController.tabBar.barTintColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        tabBarController.tabBar.isTranslucent = false
        
//        firstVC.addLocationDelegate = secondVC
//        secondVC.revealLocationDelegate = firstVC
        
        if let items = tabBarController.tabBar.items {
            for item in items {
                item.title = ""
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
            }
        }

        window = UIWindow()
        window?.backgroundColor = .black
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

