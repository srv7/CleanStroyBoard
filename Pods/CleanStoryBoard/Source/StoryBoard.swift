//
//  StoryBoard.swift
//  multiStoryBoard
//
//  Created by liubo on 2018/3/30.
//  Copyright © 2018年 cloudist. All rights reserved.
//

import UIKit

public struct Storyboard: RawRepresentable, Hashable, Equatable, Comparable {
    
    public var rawValue: String
    
    public typealias RawValue = String
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public var hashValue: Int {
        return rawValue.hashValue
    }
    
    public static func < (lhs: Storyboard, rhs: Storyboard) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    public var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    public func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyBoardID = viewControllerClass.storyBoardID
        return instance.instantiateViewController(withIdentifier: storyBoardID) as! T
    }
    
    public func instantiateInitialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

public extension UIViewController {
    public class var storyBoardID: String {
        return "\(self)"
    }
    
    public class func instance(from storyBoard: Storyboard?) -> Self {
        guard let storyBoard = storyBoard  else {
            fatalError("can not find the storyBoard")
        }
        return storyBoard.viewController(viewControllerClass: self)
    }
}
