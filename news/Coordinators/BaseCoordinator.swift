//
//  BaseCoordinator.swift
//
//  Created by Beymamat Rakhmatov on 31/08/24.
//

import UIKit

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    func start() {
        fatalError("Every coordinator must start")
    }
}
