//
//  main.swift
//  Practice_Error_Handling
//
//  Created by Priyal PORWAL on 01/07/21.
//

import Foundation

func describeTokens(input: String) -> [Token] {
    let lexer = Lexer()
    do {
        let tokens = try lexer.evaluate(input)
        print(tokens.description)
        return tokens
    } catch let Lexer.Error.invalidCharacter(character) {
        print("Invalid Charater Entered: \(character)")
    } catch {
        print(error)
    }
    return [Token]()
}

func parseTokens(tokens: [Token]) {
    do {
        let parser = Parser(tokens: tokens)
        print("Sum of Tokens: ",try parser.parse())
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected End of Input")
    } catch let Parser.Error.invalidToken(token) {
        print("Invalid Token Encounterred \(token.description)")
    } catch {
        print(error)
    }
}
print("🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏")
// Valid
let tokens1 = describeTokens(input: "1 + 2 + 3")
let tokens2 = describeTokens(input: "1 + 2 + three")
let tokens5 = describeTokens(input: "1 + 2 + 3 + 5")
let tokens6 = describeTokens(input: "2 + 3 - 5")
let tokens7 = describeTokens(input: "1 + 2 + 3 - 5")
// Invalid
let tokens3 = describeTokens(input: "1 + 2 + 3 3")
let tokens4 = describeTokens(input: "1 + 2 + + 3")
print("🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏🍏")
print("🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎")
// Valid
parseTokens(tokens: tokens1)
parseTokens(tokens: tokens5)
parseTokens(tokens: tokens6)
parseTokens(tokens: tokens7)
// Invalid
parseTokens(tokens: tokens3)
parseTokens(tokens: tokens4)
print("🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎")
