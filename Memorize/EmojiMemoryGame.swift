//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yip Kwun Chuen on 2024/9/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // static means make it "global" but the scope is only within this class
    // use private to prevent it being access by outside of the class
    private static let emojis = ["💩", "👻", "🦁", "🐱", "🐶", "🐻‍❄️", "🐯", "🐸"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numOfPairsOfCards: 8) { pairIndex in
            // can also remove "pairIndex in" and replace pairIndex below as $0 , meaning first args
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "⚠️"
            } 
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
}
