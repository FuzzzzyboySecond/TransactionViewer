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
    lazy var appLauncher: AppLauncher! = {
        return appContainer.resolve(AppLauncher.self)
    }()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = appLauncher?.generateWindows()
        return true
    }

}
