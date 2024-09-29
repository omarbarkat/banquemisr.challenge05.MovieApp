////
////  TabBarVC.swift
////  MovieApp
////
////  Created by eng.omar on 29/09/2024.
////
//
//import UIKit
//
////class TabBarVC: UITabBarController {
//
//class TabBarVC: UITabBarController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tabBarItem.title = "Home"
//        self.tabBarItem.image = UIImage(systemName: "house")
//
//        // تحميل الـ ViewControllers من الـ Storyboard
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let nowPlayingVC = storyboard.instantiateViewController(withIdentifier: "NowPlayingVC") as! NowPlayingVC
//        nowPlayingVC.apiEndpoint = .nowPlaying
//
//        let upcomingVC = storyboard.instantiateViewController(withIdentifier: "NowPlayingVC") as! NowPlayingVC
//        upcomingVC.apiEndpoint = .upcoming
//
//        let popularVC = storyboard.instantiateViewController(withIdentifier: "NowPlayingVC") as! NowPlayingVC
//        popularVC.apiEndpoint = .popular
//
//        // إعداد الـ TabBar
//        viewControllers = [
//            createNavController(for: nowPlayingVC, title: "Now Playing", image: UIImage(systemName: "film")),
//            createNavController(for: upcomingVC, title: "Upcoming", image: UIImage(systemName: "calendar")),
//            createNavController(for: popularVC, title: "Popular", image: UIImage(systemName: "star"))
//        ]
//    }
//
//    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
//        let navController = UINavigationController(rootViewController: rootViewController)
//        navController.tabBarItem.title = title
//        navController.tabBarItem.image = image
//        return navController
//    }
//}
