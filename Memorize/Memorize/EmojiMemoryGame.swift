//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 이승환 on 2021/09/20.
//

import SwiftUI // cause its part of UI

/// ViewModel is going to be a `class`
/// intermediary between Model and View
/// all the variables in class, it have to be initialized
class EmojiMemoryGame: ObservableObject {
    /// `static`
    static let emojis = ["😀","😃","😄","😁","😆","😅","🤣","😂","🙂","🙃","😉","😊","😇","🥰","😍","🤩","😘","😗"]
    /// Not an `instance` of type, is used like `Global` function
    static func createMemoryGames() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            /// static variables can be called without declaring `EmojiMemoryGame`
            emojis[pairIndex]
        }
    }
    
    /// since out model is type of struct
    /// cause the EmojiMemoryGame handles emoji, set the `CardContent` to `String`
    /// `private` only the Viewmodel itself can see `model`
    /// `private(set)` tells swift, its read-only from others, can look at this but cannot touch them
    /// `in` distributes place with arguments and the code excutes
    @Published private var model: MemoryGame<String> = createMemoryGames()
        
    
    /// to get the cards - get fresh copy
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        // if @Published is declared we don't need below thing
        //    objectWillChange.send() // send to the world this object will change
        model.choose(card)
    }
}
