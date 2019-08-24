//
//  AppLauncher.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 24/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit.UIWindow

protocol AppLauncher {
    func generateWindows() -> UIWindow
}
