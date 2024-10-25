//
//  MainViewControllerCoordinator.swift
//
//  Created by Beymamat Rakhmatov on 31/08/24.
//

import UIKit

class NewsMainViewControllerCoordinator: BaseCoordinator {
    
    private let navigationContoller: UINavigationController
    
    init(navigationContoller: UINavigationController) {
        self.navigationContoller = navigationContoller
    }
    
    override func start() {
        let mainViewController = NewsMainViewController()
        mainViewController.newsMainViewControllerCoordinator = self
        navigationContoller.pushViewController(mainViewController, animated: true)
    }
}
