//
//  DataLoaderTests.swift
//  TransactionViewerTests
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import XCTest
@testable import TransactionViewer

class DataLoaderTests: XCTestCase {

    var dataLoader: DataLoader!

    override func setUp() {
        super.setUp()
        dataLoader = BaseDataLoader()
    }

    override func tearDown() {
        dataLoader = nil
        super.tearDown()
    }

    func test_load_succes() {
        // given
        let bundle = Bundle(for: DataLoaderTests.self)
        guard let url = bundle.url(forResource: "rates", withExtension: "plist"),
            let expected = try? Data(contentsOf: url) else {
                XCTAssert(false, "Can't get url for rates.plist")
                return
        }

        // when
        let result = dataLoader.loadData(from: url)

        // then
        XCTAssertEqual(expected, try? result.get())
    }

    func test_load_notLocalURL() {
        // given
        let url = URL(string: "https://yandex.ru")!
        let expectedError: DataLoaderError = .notLocalURL

        // when
        let result = dataLoader.loadData(from: url)

        // then
        XCTAssertEqual(expectedError, result.error)
    }

}
