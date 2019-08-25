//
//  DataLoader.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

enum DataLoaderError: Error {
    case notLocalURL
    case invalideData
}

protocol DataLoader {
    func loadData(from url: URL, completion: @escaping (Result<Data, DataLoaderError>) -> Void)
}
