//
//  UIViewController+Extensions.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

extension UIViewController {

    static func instantiateFromStoryboard<T: UIViewController>() -> T? {
        let bundle = Bundle(for: self)
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard.instantiateInitialViewController() as? T
    }

}
