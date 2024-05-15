//
//  Game.swift
//  Apple Pie
//
//  Created by Firuza on 17.03.2024.
//

import Foundation

struct Game{
    var word: String
    var incorrrectMovesRemaining:Int
    var guessedLetters: [Character]
    
    var formattedWord: String{
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }
            else{
                guessedWord  += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrrectMovesRemaining -= 1
            
        }
    }
    
}
