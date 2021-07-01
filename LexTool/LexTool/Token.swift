//
//  Token.swift
//  Practice_Error_Handling
//
//  Created by Priyal PORWAL on 01/07/21.
//

import Foundation
enum Token: CustomStringConvertible {
    case numbers(Int)
    case plus
    case minus
    
    var description: String {
        switch self {
        case let .numbers(num):
            return ("Number \(num)")
        case .plus:
            return ("Symbol +")
        case .minus:
            return ("Symbol -")
        }
    }
}
