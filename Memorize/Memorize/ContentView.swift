//
//  ContentView.swift
//  Memorize
//
//  Created by 이승환 on 2021/09/14.
//

import SwiftUI // imports when we build UIs

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .foregroundColor(.yellow)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card // highly recommended, read-only state
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            if card.isFacedUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(card.content).font(.title)
            } else if card.isMatched {
                shape.opacity(0.0)
            } else {
                shape.fill().foregroundColor(.yellow)
            }
        }
    }
}

