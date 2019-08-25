//
//  BaseAppCoordinator.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 24/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class BaseAppCoordinator: AppCoordinator {

    var window: UIWindow?

    private var rootViewController: UINavigationController?

    init() {
        configureRootViewController()
    }

    func start(in window: UIWindow?) {
        window?.rootViewController = rootViewController
    }

    private func configureRootViewController() {
        let viewController: ProductsViewController = ProductsViewController.instantiateFromStoryboard()!
        viewController.viewModel = BaseProductsViewModel()
        rootViewController = UINavigationController(rootViewController: viewController)
    }

}
