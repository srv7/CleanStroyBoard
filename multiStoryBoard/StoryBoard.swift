//
//  StoryBoard.swift
//  multiStoryBoard
//
//  Created by liubo on 2018/3/30.
//  Copyright © 2018年 cloudist. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case Main, Home, Feed, Account
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyBoardID = viewControllerClass.storyBoardID
        return instance.instantiateViewController(withIdentifier: storyBoardID) as! T
    }
    
    func instantiateInitialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    class var storyBoardID: String {
        return "\(self)"
    }
    
    class func instance(from storyBoard: Storyboard) -> Self {
        return storyBoard.viewController(viewControllerClass: self)
    }
}
