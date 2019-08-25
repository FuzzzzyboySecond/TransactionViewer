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

enum DataLoaderEndpoint: String {
    case rates
    case transactions

    var url: URL? {
        let bundle = Bundle.main
        return bundle.url(forResource: rawValue, withExtension: "plist")
    }
}

protocol DataLoader {
    func loadData(from endpoint: DataLoaderEndpoint, completion: @escaping (Result<Data, DataLoaderError>) -> Void)
    func loadData(from url: URL, completion: @escaping (Result<Data, DataLoaderError>) -> Void)
}

extension DataLoader {
    func loadData(from endpoint: DataLoaderEndpoint, completion: @escaping (Result<Data, DataLoaderError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.notLocalURL))
            return
        }
        loadData(from: url, completion: completion)
    }
}
