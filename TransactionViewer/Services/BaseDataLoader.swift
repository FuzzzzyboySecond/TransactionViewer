//
//  BaseDataLoader.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

final class BaseDataLoader: DataLoader {

    func loadData(from url: URL) -> Result<Data, DataLoaderError> {
        guard url.isFileURL else { return .failure(.notLocalURL) }
        return .success(Data())
    }

}
