//
//  EmojiGameViewModel.swift
//  Memorize
//
//  Created by Kaue Sousa on 22/05/23.
//

import SwiftUI

final class EmojiGameViewModel: ObservableObject {
    static let emojis: [String] = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        .init(numberOfPairs: 3) { index in
            emojis[index]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
