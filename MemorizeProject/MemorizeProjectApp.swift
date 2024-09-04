//
//  MemorizeProjectApp.swift
//  MemorizeProject
//
//  Created by Alfredo Perry on 8/29/24.
//

import SwiftUI

@main
struct MemorizeProjectApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
