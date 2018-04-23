//
//  StoryBoard.swift
//  multiStoryBoard
//
//  Created by liubo on 2018/3/30.
//  Copyright © 2018年 cloudist. All rights reserved.
//

import UIKit

struct Storyboard: RawRepresentable, Hashable, Equatable, Comparable {
    
    internal var rawValue: String
    
    typealias RawValue = String
    
    init?(rawValue: String) {
        self.rawValue = rawValue
    }
    
    var hashValue: Int {
        return rawValue.hashValue
    }
    
    static func < (lhs: Storyboard, rhs: Storyboard) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
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
    
    class func instance(from storyBoard: Storyboard?) -> Self {
        guard let storyBoard = storyBoard  else {
            fatalError("can not find the storyBoard")
        }
        return storyBoard.viewController(viewControllerClass: self)
    }
}
