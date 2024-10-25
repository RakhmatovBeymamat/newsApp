//
//  AuthViewControllerCoordinator.swift
//
//  Created by Beymamat Rakhmatov on 31/08/24.
//

import UIKit

class AuthViewControllerCoordinator: BaseCoordinator {
    
    private let navigationContoller: UINavigationController
    
    init(navigationContoller: UINavigationController) {
        self.navigationContoller = navigationContoller
    }
    
    override func start() {
        let authViewController = AuthViewController()
        authViewController.authViewControllerCoordinator = self
        navigationContoller.pushViewController(authViewController, animated: true)
    }
    
    func startMainViewController() {
        let mainCoordinator = NewsMainViewControllerCoordinator(navigationContoller: navigationContoller)
        add(coordinator: mainCoordinator)
        mainCoordinator.start()
    }
    
}
