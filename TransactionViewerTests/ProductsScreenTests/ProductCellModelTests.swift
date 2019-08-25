//
//  ProductCellModelTests.swift
//  TransactionViewerTests
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import XCTest
@testable import TransactionViewer

class ProductCellModelTests: XCTestCase {

    var completion: ((ProductCellModel) -> Void)?

    override func tearDown() {
        completion = nil
        super.tearDown()
    }

    func test_init_many_transactions() {
        // given
        let title = "A"
        let transactionsCount = 2
        let expectedTitle = "A"
        let expectedDetails = "2 transactions"

        // when
        let cellModel = BaseProductCellModel(title: title, transactionsCount: transactionsCount, delegate: self)

        // then
        XCTAssertEqual(cellModel.title, expectedTitle)
        XCTAssertEqual(cellModel.detailsText, expectedDetails)
    }

    func test_init_one_transactions() {
        // given
        let title = "A"
        let transactionsCount = 1
        let expectedTitle = "A"
        let expectedDetails = "1 transaction"

        // when
        let cellModel = BaseProductCellModel(title: title, transactionsCount: transactionsCount, delegate: self)

        // then
        XCTAssertEqual(cellModel.title, expectedTitle)
        XCTAssertEqual(cellModel.detailsText, expectedDetails)
    }

    func test_select() {
        // given
        let expectedTitle = "A"
        let transactionsCount = 2

        // then
        completion = { cellModel in
            XCTAssertEqual(expectedTitle, cellModel.title)
        }

        // when
        let cellModel = BaseProductCellModel(title: expectedTitle, transactionsCount: transactionsCount, delegate: self)
        cellModel.select()

    }

}

extension ProductCellModelTests: ProductCellModelDelegate {

    func productCellViewModelDidSelected(_ cellModel: ProductCellModel) {
        completion?(cellModel)
    }

}
