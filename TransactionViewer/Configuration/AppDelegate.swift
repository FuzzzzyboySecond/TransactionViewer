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
    lazy var rateService: RateService = {
        return appContainer.resolve(RateService.self)!
    }()

    lazy var appCoordinator: AppCoordinator = {
        return appContainer.resolve(AppCoordinator.self)!
    }()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        appCoordinator.start(in: window)

        rateService.loadRates { (result) in
            print(result)
        }

        return true
    }

}
