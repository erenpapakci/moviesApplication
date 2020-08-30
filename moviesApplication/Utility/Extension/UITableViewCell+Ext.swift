//
//  UITableViewCell+Ext.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
