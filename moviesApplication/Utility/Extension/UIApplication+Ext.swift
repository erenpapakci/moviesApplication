//
//  UIApplication+Ext.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    class func getTopMostViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
    {
        if let nav = base as? UINavigationController
        {
            return getTopMostViewController(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController
        {
            if let selected = tab.selectedViewController {
                return getTopMostViewController(base: selected)
            }
        }
        
        if let presented = base?.presentedViewController
        {
            return getTopMostViewController(base: presented)
        }
        
        return base
    }
    
    class func getWindow() -> UIWindow?
    {
        return UIApplication.shared.keyWindow;
    }
}
