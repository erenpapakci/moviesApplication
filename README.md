## moviesApplication 
![Build Status](https://camo.githubusercontent.com/42dd3e8b9f24ef08c3414bc23af2b2aafdbab210/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f58636f64652d31302d626c75652e737667)
![Build Status](https://camo.githubusercontent.com/4a68628f8bed3c6dc6a0247984cf7570ab7be7c7/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f73776966742d342d6f72616e67652e737667)


**This project was built with the mvvm architecture. It includes base viewcontroller and viewmodel, allowing you to build on different projects. A clean code was tried.**

## Tech Stack

> MVVM Architecture

> SOLID

> Modular Architecture

> Observers

> No third-party Networking 

> Base ViewModel, Base ViewController

> Extensions

![](moviesapp.gif)

## Installation Guide

* git clone https://github.com/erenpapakci/moviesApplication.git

* cd moviesApplication

* pod install

## Base ViewController

ViewControllers base is located here. Here more can be done in different additions. When creating a new viewmodel, it is important for clean code to get participation from here instead of doing new.

```javascript

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
  
}
```

## Base ViewController Protocol

Here's what the viewcontrols promised.

```javascript

import Foundation
import UIKit

public protocol BaseViewControllerProtocol where Self: UIViewController {
    
    func startIndicator()
    
    func stopIndicator()
}
```

## Base ViewModel

```javascript

public class BaseViewModel {
    
    public required init() {
        
    }
}

```

## ViewModel Protocol

Here's what the ViewModel promised. 


```javascript

public protocol HomeViewModelProtocol where Self: BaseViewModel {
    
    var movieResult: Observable<MovieResult> { get set }
    
    func searchMovies(searchText: String, page: Int)
    
    func clear()
}
```

## ViewModel

```javascript

public final class DetailViewModel: BaseViewModel, DetailViewModelProtocol {
    
    public lazy var movieResult = Observable<MovieDetail>()
    
    public func detailMovies(movieId: Int) {
        let movieId = String(movieId)
        let query = Constant.baseUrlDetail + movieId + Constant.movieApiKey
        Services.shared.execute(query: query, type: MovieDetail.self, completion: { [weak self] result in
            self?.movieResult.data = result
        })
    }
}
```

## Networking

Network Module 3. part does not include a library. Uses URLSession. and assigns the request according to the incoming url.

```javascript

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
```

## Acknowledgement

Thanks for their guidance on base architectures and code review. <a href="https://github.com/sonmezvolkan">Volkan Sönmez</a>
