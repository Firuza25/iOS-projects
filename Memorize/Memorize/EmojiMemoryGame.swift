//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Firuza on 01.03.2024.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🐰","🐥","🐬","🦞", "🦋", "🐞", "🐁", "🐇", "🌝", "🌚"]
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 9) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
        
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var color: Color {
        .orange
    }
    
    var score: Int {
        model.score
    }
   
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
