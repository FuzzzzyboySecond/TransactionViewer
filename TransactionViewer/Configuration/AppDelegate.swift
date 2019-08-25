//
//  AppDelegate.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 24/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appContainer = AppContainer().container

    lazy var appCoordinator: AppCoordinator = {
        return appContainer.resolve(AppCoordinator.self)!
    }()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        appCoordinator.start(in: window)

        let dataLoader = appContainer.resolve(DataLoader.self)!
        let mapper = appContainer.resolve(RateMapper.self)!
        dataLoader.loadData(from: .rates) { result in
            switch result {
            case .success(let data):
                print("success")
                let rates = mapper.mapRates(from: data)
                print("rates: \(rates)")
            case .failure:
                print("failure")
            }
        }

        return true
    }

}
