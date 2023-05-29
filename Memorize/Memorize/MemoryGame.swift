//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kaue Sousa on 22/05/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card] = []
    private var faceUpCardIndex: Int?
    
    mutating func choose(_ card: Card) {
        guard let chosenCard = cards.first(where: {$0.id == card.id })?.id,
              !cards[chosenCard].isFaceUp,
              !cards[chosenCard].isMatched
        else {
            return
        }
        
        if let potentialMatchIndex = faceUpCardIndex {
            if cards[chosenCard].content == cards[potentialMatchIndex].content {
                cards[chosenCard].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            faceUpCardIndex = nil
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            faceUpCardIndex = chosenCard
        }
        
        cards[chosenCard].isFaceUp.toggle()
    }
    
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        for pair in 0..<numberOfPairs {
            let content: CardContent = createCardContent(pair)
            cards.append(Card(content: content, id: pair*2))
            cards.append(Card(content: content, id: pair*2+1))
        }
    }
}

extension MemoryGame {
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
