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
    /// since out model is type of struct
    /// cause the EmojiMemoryGame handles emoji, set the `CardContent` to `String`
    /// `private` only the Viewmodel itself can see `model`
    /// `private(set)` tells swift, its read-only from others, can look at this but cannot touch them
    /// `in` distributes place with arguments and the code excutes
    @Published private var model: MemoryGame<String>
    
    /// add `Theme` to Viewmodel
    private(set) var theme: Theme
    
    /// `static`
    /// Not an `instance` of type, is used like `Global` function
    static func createMemoryGames(_ theme: Theme) -> MemoryGame<String> {
        let emojis: Array<String> = theme.emojis.shuffled()
        var cardsToShow: Int = theme.numberOfPairsOfCards ?? Int.random(in: 3...theme.emojis.count)
        if cardsToShow > theme.emojis.count { cardsToShow = theme.emojis.count }
        
        return MemoryGame<String>(numberOfPairsOfCards: cardsToShow) { pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    init(startingTheme: Theme? = nil) {
        let selectedTheme = startingTheme ?? themes.randomElement()!
        // init private(set) theme with selectedTheme
        self.theme = selectedTheme
        model = EmojiMemoryGame.createMemoryGames(selectedTheme)
    }
    
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
