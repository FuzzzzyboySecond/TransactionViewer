//
//  Currency.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

enum Currency: String, Codable {
    case usd = "USD"
    case gbp = "GBP"
    case cad = "CAD"
    case aud = "AUD"
    case eur = "EUR"

    var symbol: String {
        switch self {
        case .usd:
            return "＄"
        case .gbp:
            return "￡"
        case .cad:
            return "C＄"
        case .aud:
            return "A＄"
        case .eur:
            return "€"
        }
    }
}
