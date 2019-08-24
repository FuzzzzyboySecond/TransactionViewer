//
//  BaseAppLauncher.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 24/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class BaseAppLauncher: AppLauncher {

    func generateWindows() -> UIWindow {
        let window = UIWindow()
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        return window
    }

}
