//
//  TabBarViewController.swift
//  Desafio_30_10_2020
//
//  Created by Mizia Lima on 11/4/20.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    static let shared = TabBarViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewControllers()
    }
    
    func loadViewControllers(){
        var arrayViews = [UIViewController]()
        
        if let viewController1 = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? MainViewController {
            viewController1.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
            arrayViews.append(viewController1)
            let navigation = UINavigationController(rootViewController: viewController1)
            arrayViews.append(navigation)
        }
        
        if let viewController2 = UIStoryboard(name: "Configuration", bundle: nil).instantiateInitialViewController() as? ConfigurationViewController {
            viewController2.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
            arrayViews.append(viewController2)
        }
        
        viewControllers = arrayViews
        self.selectedIndex = 0
    }
}


extension UIViewController {
    class func replaceRootViewController(viewController: UIViewController) {
        guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
        else {
            return
        }
        let rootViewController = window.rootViewController!

        viewController.view.frame = rootViewController.view.frame
        viewController.view.layoutIfNeeded()

        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            window.rootViewController = viewController
        }, completion: nil)
    }
}
