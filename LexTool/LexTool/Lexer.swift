//
//  Lexer.swift
//  Practice_Error_Handling
//
//  Created by Priyal PORWAL on 01/07/21.
//

import Foundation
class Lexer {
    var input: String = ""
    var position: String.Index
    
    init() {
        position = input.startIndex
    }
    
    enum Error: Swift.Error {
        case invalidCharacter(Character, Int)
    }
    
    private func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    private func advancePosition() {
        assert(position<input.endIndex, "Invalid Index: Index out of bounds")
        position = input.index(after: position)
    }
    
    private func getNumber() -> Int {
        var value = 0
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                if let digit = Int(String(nextCharacter)) {
                    value = value * 10 + digit
                    advancePosition()
                }
            default:
                return value
            }
        }
        return value
    }
    
    private func lex() throws -> [Token] {
        print("\(#function)")
        var tokens = [Token]()
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                tokens.append(.numbers(getNumber()))
            case "+":
                tokens.append(.plus)
                advancePosition()
            case " ":
                advancePosition()
            case "-":
                tokens.append(.minus)
                advancePosition()
            default:
                throw Error.invalidCharacter(nextCharacter, input.distance(from: input.startIndex, to: position))
            }
        }
        return tokens
    }
    
    func evaluate(_ input: String) throws -> [Token] {
        self.input = input
        self.position = input.startIndex
        return try lex()
    }
}
