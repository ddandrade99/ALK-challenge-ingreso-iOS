//
//  TabViewController.swift
//  ALK-challenge-ingreso-iOS
//
//  Created by Daniel De Andrade Souza on 13/09/22.
//

import UIKit

class TabViewController: UITabBarController {

    let searchViewController = SearchViewController()
    let favoritesViewController = FavoritesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar(){
        self.setViewControllers([searchViewController, favoritesViewController], animated: true)
        searchViewController.title = "Buscar"
        favoritesViewController.title = "Favoritos"
        guard let items = self.tabBar.items else { return }
        let images = ["magnifyingglass", "star"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
    }
    

}
