//
//  BaseDataLoader.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

final class BaseDataLoader: DataLoader {

    func loadData(from url: URL, completion: @escaping (Result<Data, DataLoaderError>) -> Void) {
        // imitation async
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            guard url.isFileURL else { return completion(.failure(.notLocalURL)) }
            do {
                let data = try Data(contentsOf: url)
                return completion(.success(data))
            } catch {
                return completion(.failure(.invalideData))
            }
        }
    }

}
