//
//  EmojiGameViewModel.swift
//  Memorize
//
//  Created by Kaue Sousa on 22/05/23.
//

import SwiftUI

final class EmojiGameViewModel {
    let emojis: [String] = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"]
    
    private lazy var model: MemoryGame<String> = .init(numberOfPairs: 4) { index in
        emojis[index]
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
