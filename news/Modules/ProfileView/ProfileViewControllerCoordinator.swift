//
//  ProfileViewControllerCoordinator.swift
//
//  Created by Beymamat Rakhmatov on 31/08/24.
//

import UIKit

class ProfileViewControllerCoordinator: BaseCoordinator {
    
    private let navigationContoller: UINavigationController
    
    init(navigationContoller: UINavigationController) {
        self.navigationContoller = navigationContoller
    }
    
    override func start() {
        let profileViewController = ProfileViewController()
        profileViewController.profileViewControllerCoordinator = self
        navigationContoller.pushViewController(profileViewController, animated: true)
    }
}
