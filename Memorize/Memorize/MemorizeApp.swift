//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 이승환 on 2021/09/14.
//

import SwiftUI

@main
struct MemorizeApp: App {
    /// used free init to create `EmojiMemoryGame`
    let game = EmojiMemoryGame() // Reference Type
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
