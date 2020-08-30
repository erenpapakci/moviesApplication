//
//  Networking.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation
import UIKit

class Services {
    
    public static let shared = Services()
    
    private var viewController: BaseViewControllerProtocol?

    public func execute<T: Codable>(query: String, type: T.Type, completion: @escaping (T) -> (), addIndicator: Bool = false, failure: ((String) -> Void)? = nil) {
        guard let url = URL(string: query) else {
            failure?("this format is not correct")
            return
        }
        
        startIndicatorIfNeeded(flag: addIndicator)
                
        URLSession.shared.dataTask(with: url) { data, response, error in
            self.stopIndicatorIfNeeded(flag: addIndicator)
            
            guard let data = data, error == nil else { return }
            
            print(String(decoding: data, as: UTF8.self))
            
            do {
               var result = try JSONDecoder().decode(type, from: data)
                completion(result)
               }
            catch (let ex) {
                failure?(ex.localizedDescription)
                print(ex.localizedDescription)
                return
            }

        }.resume()
    }
    
    private func startIndicatorIfNeeded(flag: Bool) {
        if !flag { return }
        
        self.viewController = UIApplication.getTopMostViewController() as? BaseViewControllerProtocol
        
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.startIndicator()
        }
    }
    
    private func stopIndicatorIfNeeded(flag: Bool) {
        if !flag { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.stopIndicator()
        }
    }
}
