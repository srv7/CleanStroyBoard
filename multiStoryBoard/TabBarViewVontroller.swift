//
//  TabBarViewVontroller.swift
//  multiStoryBoard
//
//  Created by liubo on 2018/3/30.
//  Copyright © 2018年 cloudist. All rights reserved.
//

import UIKit

class TabBarViewVontroller: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        let n1 = HomeNavigationController.instance(from: Storyboard.Home)
        let n2 = FeedNavigationController.instance(from: .Feed)
        let n3 = AccountNavigationController.instance(from: .Account)
        
        viewControllers = [n1, n2, n3]
        
        guard let items = tabBar.items else {
            return
        }
        for item in items {
            item.title = "X"
        }
        
    }
}
