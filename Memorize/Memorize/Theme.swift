//
//  Theme.swift
//  Memorize
//
//  Created by μ΄μΉν on 2021/10/05.
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
          emojis: ["π","π","π","π","π","π","π€£","π","π","π","π","π","π","π₯°","π","π€©","π","π"],
          color: .yellow
         ),
    Theme(name: "vechicles",
          emojis: ["π","π","π","π","π΄","π²","π","πΊ","π","π","π","π ","π","βοΈ","π","πΈ","π","πΆ","π€","π’","π³","π","π","π΅"],
          color: .blue),
    Theme(name: "fruits",
          emojis: ["π","π","π","π","π","π","π","π","π","π","π","π₯₯"],
          color: .green)
]
