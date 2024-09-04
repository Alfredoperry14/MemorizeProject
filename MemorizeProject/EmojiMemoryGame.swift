//
//  EmojiMemoryGame.swift
//  MemorizeProject
//
//  Created by Alfredo Perry on 8/30/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    private static let emojis = ["👻", "🎃", "👹", "💀","🍭","😈","🧙‍♀️","🕷️","🕸️","☠️","🫣","😱"]
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 12){ pairIndex in
            if(emojis.indices.contains(pairIndex)){
                return emojis[pairIndex]
            }
            else{
                return "❌"
            }
        }
    }
        
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
