//
//  AppCoordinator.swift
//
//  Created by Beymamat Rakhmatov on 31/08/24.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let coordinator = NewsMainViewControllerCoordinator(navigationContoller: navigationController)
        add(coordinator: coordinator)
        coordinator.start()
    }
}
