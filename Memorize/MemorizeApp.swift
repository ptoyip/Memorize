//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yip Kwun Chuen on 2024/9/17.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
