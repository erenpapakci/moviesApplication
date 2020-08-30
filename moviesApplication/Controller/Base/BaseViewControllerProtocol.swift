//
//  BaseViewControllerProtocol.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation
import UIKit

public protocol BaseViewControllerProtocol where Self: UIViewController {
    
    func startIndicator()
    
    func stopIndicator()
}
