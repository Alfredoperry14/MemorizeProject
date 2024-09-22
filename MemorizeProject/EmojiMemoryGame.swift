//
//  EmojiMemoryGame.swift
//  MemorizeProject
//
//  Created by Alfredo Perry on 8/30/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["👻", "🎃", "👹", "💀","🍭","😈","🧙‍♀️","🕷️","🕸️","☠️","🫣","😱"]
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 11){ pairIndex in
            if(emojis.indices.contains(pairIndex)){
                return emojis[pairIndex]
            }
            else{
                return "❌"
            }
        }
    }
        
    var cards: Array<Card>{
        return model.cards
    }
    
    var color: Color {
        .orange
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card){
        model.choose(card)
    }
}
