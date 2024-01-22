//
//  TabBarViewController.swift
//  CourseChallengeTabBar
//
//  Created by Renato Vieira da Silva on 12/01/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configItemsTabBar()
        configTabBar()
    }
    
    private func configItemsTabBar() {
        guard let items = tabBar.items else { return }
        
        items[0].title = "Tela 01"
        items[1].title = "Tela 02"
        items[2].title = "Tela 03"
    }
    
    private func configTabBar() {
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }
}
