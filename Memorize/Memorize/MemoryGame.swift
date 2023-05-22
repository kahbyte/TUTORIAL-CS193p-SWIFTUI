//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kaue Sousa on 22/05/23.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card] = []
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        for pair in 0..<numberOfPairs {
            let content: CardContent = createCardContent(pair)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
}

extension MemoryGame {
    struct Card {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
