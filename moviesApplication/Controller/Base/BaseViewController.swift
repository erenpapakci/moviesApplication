//
//  BaseViewController.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<T: BaseViewModel> : UIViewController, BaseViewControllerProtocol {
    
    internal var viewModel: T
    
    private var indicatorContainerView: UIView?
    
    public init() {
        self.viewModel = T.init()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = T.init()
        super.init(coder: coder)
    }
    
    public func startIndicator() {
        stopIndicator()
        guard let window = UIApplication.getWindow() else { return }
        self.indicatorContainerView = getIndicatorContainerView()
        addIndicatorView()
        
        window.addSubview(indicatorContainerView!)
        window.bringSubviewToFront(indicatorContainerView!)
    }
    
    public func stopIndicator() {
        guard let indicatorContainerView = self.indicatorContainerView else { return }
        indicatorContainerView.removeFromSuperview()
        self.indicatorContainerView = nil
    }
    
    private func getIndicatorContainerView() -> UIView {
        let indicatorContainerView = UIView()
        indicatorContainerView.frame = UIScreen.main.bounds
        indicatorContainerView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        return indicatorContainerView
    }
    
    private func addIndicatorView() {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.style = .whiteLarge
        
        indicatorContainerView?.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        indicatorView.centerYAnchor.constraint(equalTo: indicatorContainerView!.centerYAnchor).isActive = true
        indicatorView.centerXAnchor.constraint(equalTo: indicatorContainerView!.centerXAnchor).isActive = true
        
        indicatorView.startAnimating()
    }

}
