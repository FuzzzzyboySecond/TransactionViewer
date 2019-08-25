//
//  AppContainer.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 24/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Swinject

final class AppContainer {

    let container = Container()

    init() {
        registerAppCoordinator()
        registerDataLoader()
        registerRateMapper()
        registerTransactionsMapper()
        registerRateService()
        registerTransactionService()
    }

    private func registerAppCoordinator() {
        container.register(AppCoordinator.self) { _ in
            BaseAppCoordinator()
        }.inObjectScope(.container)
    }

    private func registerDataLoader() {
        container.register(DataLoader.self) { _ in
            BaseDataLoader()
        }.inObjectScope(.container)
    }

    private func registerRateMapper() {
        container.register(RateMapper.self) {_ in
            BaseRateMapper()
        }.inObjectScope(.transient)
    }

    private func registerTransactionsMapper() {
        container.register(TransactionMapper.self) { _ in
            BaseTransactionMapper()
        }.inObjectScope(.transient)
    }

    private func registerRateService() {
        container.register(RateService.self) { resolver in
            BaseRateService(dataLoader: resolver.resolve(DataLoader.self)!,
                            mapper: resolver.resolve(RateMapper.self)!)
        }.inObjectScope(.transient)
    }

    private func registerTransactionService() {
        container.register(TransactionService.self) { resolver in
            BaseTransactionService(dataLoader: resolver.resolve(DataLoader.self)!,
                                   mapper: resolver.resolve(TransactionMapper.self)!)
        }.inObjectScope(.transient)
    }

}
