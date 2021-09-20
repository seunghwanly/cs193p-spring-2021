//
//  MemoryGame.swift
//  Memorize
//
//  Created by 이승환 on 2021/09/20.
//

import Foundation // Array, String, Dictionary, ...

/// when using certain don't care need to declare the type
/// don't care type has to do with '==' operator, use `where` and `Equatable`
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    // calling this function will change the struct
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFacedUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFacedUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFacedUp.toggle() // card.isFacedUp = !card.isFacedUp
        }
        print("\(cards)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            /// can use free initializer
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
    }
    
    /// `MemoryGame.Card`
    /// why do we namespace?
    /// by nesting this, it makes clear that  this Card is of MemoryGame card
    struct Card: Identifiable {
        /// set default
        var isFacedUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent   // use don't care for future development
        var id: Int
    }
}
