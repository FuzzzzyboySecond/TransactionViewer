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
    }

    private func registerAppCoordinator() {
        container.register(AppCoordinator.self) { _ in
            BaseAppCoordinator()
        }
    }

}
