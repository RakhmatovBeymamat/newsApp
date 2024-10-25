//
//  AuthViewContoller.swift
//
//  Created by Beymamat Rakhmatov on 31/08/24.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
    
    weak var authViewControllerCoordinator: AuthViewControllerCoordinator?
    
    private var showMainView: UIButton = {
        let button = UIButton()
        button.setTitle("MainView open", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(mainViewOpen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow 
        title = "Auth/Reg"
        
        setView()
    }
    
    private func setView() {
        view.addSubview(showMainView)
        
        showMainView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.width.equalTo(200)
            make.height.equalTo(50)

        }
    }
    
    @objc private func mainViewOpen() {
        authViewControllerCoordinator?.startMainViewController()
    }
    
}
