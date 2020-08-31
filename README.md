## moviesApplication 
![Build Status](https://camo.githubusercontent.com/42dd3e8b9f24ef08c3414bc23af2b2aafdbab210/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f58636f64652d31302d626c75652e737667)
![Build Status](https://camo.githubusercontent.com/4a68628f8bed3c6dc6a0247984cf7570ab7be7c7/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f73776966742d342d6f72616e67652e737667)


**This project was built with the mvvm architecture. It includes base viewcontroller and viewmodel, allowing you to build on different projects. A clean code was tried.**


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

## Base View Controller

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

## Acknowledgement

Thanks for their guidance on base architectures and code review. <a href="https://github.com/sonmezvolkan">Volkan Sönmez</a>
