//
//  UIViewController+Ext.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation
import UIKit

enum Storyboard: String {
    case main = "Main"
}

extension UIViewController {
    
    class func instantiateFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper(with: .main, identifier: String(describing: self))
    }
    
    class func instantiateFromStoryboard(storyboard: Storyboard = .main) -> Self {
        return instantiateFromStoryboardHelper(with: storyboard, identifier: String(describing: self))
    }
    
    private class func instantiateFromStoryboardHelper<T>(with storyboard: Storyboard, identifier: String?) -> T {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        if let identifier = identifier {
            return storyboard.instantiateViewController(withIdentifier: identifier) as! T
        } else {
            return storyboard.instantiateInitialViewController() as! T
        }
    }
}
