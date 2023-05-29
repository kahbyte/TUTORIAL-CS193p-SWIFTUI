//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kaue Sousa on 27/04/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game: EmojiGameViewModel = .init()
     
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
