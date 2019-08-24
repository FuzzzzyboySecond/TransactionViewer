//
//  AppLauncherTests.swift
//  TransactionViewerTests
//
//  Created by Kirill Shakhansky on 24/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import XCTest
@testable import TransactionViewer

class AppLauncherTests: XCTestCase {

    var appLauncher: AppLauncher!

    override func setUp() {
        super.setUp()
        appLauncher = BaseAppLauncher()
    }

    override func tearDown() {
        appLauncher = nil
        super.tearDown()
    }

    func test_generateWindow() {
        _ = appLauncher.generateWindows()
    }

}
