//
//  Theme.swift
//  Memorize
//
//  Created by 이승환 on 2021/10/05.
//

import SwiftUI

struct Theme {
    var name: String
    var emojis: Array<String>
    var numberOfPairsOfCards: Int?
    var color: Color
}

let themes: Array<Theme> = [
    Theme(name: "faces",
          emojis: ["😀","😃","😄","😁","😆","😅","🤣","😂","🙂","🙃","😉","😊","😇","🥰","😍","🤩","😘","😗"],
          color: .yellow
         ),
    Theme(name: "vechicles",
          emojis: ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"],
          color: .blue),
    Theme(name: "fruits",
          emojis: ["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍒","🍑","🍍","🥥"],
          color: .green)
]
