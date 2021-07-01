//
//  Parser.swift
//  Practice_Error_Handling
//
//  Created by Priyal PORWAL on 01/07/21.
//

import Foundation
class Parser {
    var tokens: [Token]
    var position: Int
    
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(Token, Int)
    }
    
    init(tokens: [Token]) {
        self.tokens = tokens
        self.position = 0
    }
    
    func getNextToken() throws -> Token? {
        var token: Token
        guard position < tokens.count else {
            return nil
        }
        
        token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = try getNextToken() else {
            throw Error.unexpectedEndOfInput
        }
        
        switch token {
        case let .numbers(num):
            return num
        case .plus:
            throw Error.invalidToken(token, position)
        case .minus:
            throw Error.invalidToken(token, position)
        }
    }
    func parse() throws -> Int {
        print("\(#function)")
        var total: Int = try getNumber()
        
        while let nextToken = try getNextToken() {
            switch nextToken {
            case .plus:
                let number = try getNumber()
                total += number
            case .minus:
                let number = try getNumber()
                total -= number
            case .numbers:
                throw Error.invalidToken(nextToken, position)
            }
        }
        return total
    }
}
