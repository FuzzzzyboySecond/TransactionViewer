//
//  BaseAppCoordinator.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 24/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class BaseAppCoordinator: AppCoordinator {

    private let window: UIWindow
    private var navigationController: UINavigationController?

    init(window: UIWindow) {
        self.window = window
        configureRootViewController()
        window.rootViewController = navigationController
    }

    func start() {
        window.makeKeyAndVisible()
    }

    private func configureRootViewController() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        navigationController = UINavigationController(rootViewController: viewController)
    }

}
