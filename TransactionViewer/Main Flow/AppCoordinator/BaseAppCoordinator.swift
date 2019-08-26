//
//  BaseAppCoordinator.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 24/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit
import Swinject

final class BaseAppCoordinator: AppCoordinator {

    var window: UIWindow?

    private let container: Container
    private var rootViewController: UINavigationController?

    init(container: Container) {
        self.container = container
        configureRootViewController()
    }

    func start(in window: UIWindow?) {
        window?.rootViewController = rootViewController
    }

    private func configureRootViewController() {
        let viewController: ProductListViewController = ProductListViewController.instantiateFromStoryboard()!
        viewController.viewModel = BaseProductListViewModel(
            transactionService: container.resolve(TransactionService.self)!,
            delegate: self
        )
        rootViewController = UINavigationController(rootViewController: viewController)
    }

    private func routeToProductScreen(with product: Product) {
        let viewController = ProductViewController()
        viewController.viewModel = BaseProductViewModel(product: product,
                                                        rateService: container.resolve(RateService.self)!)
        rootViewController?.pushViewController(viewController, animated: true)
    }

}

extension BaseAppCoordinator: ProductListViewModelDelegate {

    func productListViewModel(_ viewModel: ProductListViewModel, didSelectProduct product: Product) {
        routeToProductScreen(with: product)
    }

}
