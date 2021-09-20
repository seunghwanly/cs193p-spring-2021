//
//  ContentView.swift
//  Memorize
//
//  Created by 이승환 on 2021/09/14.
//

import SwiftUI // imports when we build UIs

/// used Enum declaration for theme selection
enum CardThemeStyle : String, Equatable, CaseIterable {
    case blackTheme = "Black"
    case amberTheme = "Yellow"
    case blueTheme = "Blue"
    case greenaryTheme = "Green"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

/// `struct`: collection of variables
/// we can also have some functions in `struct`
/// there is no inheritence in struct
/// use functional programming to build model, logic and UI

/// `View`: means it behaves like views
/// just talk about functionality not implementing
/// View means rectangular area in Screen
/// display things inside, Taps, Swipe, Pinch etc
/// in implementation is much powerful
/// Every Components means View
struct ContentView: View {
    
    func shuffledEmojis(_ size: Int) -> [String] {
        let standardEmojis: [String] = ["😭", "🥺", "🧐", "😀", "😎", "🤨", "😵", "🥲", "😇", "🥶", "🤬", "🤯"]
        var newlyCreatedEmojis: [String] = standardEmojis
        while newlyCreatedEmojis.count != size {
            newlyCreatedEmojis.remove(at: Int.random(in: 0..<newlyCreatedEmojis.count))
        }
        newlyCreatedEmojis.shuffle()
        return newlyCreatedEmojis
    }
    
    /// selected from user
    @State var selectedTheme: CardThemeStyle = .blackTheme // set default
    @State var selectedSize: Int = 12
    
    let imageDescription = ["circle.grid.cross.left.fill", "circle.grid.cross.up.fill", "circle.grid.cross.right.fill", "circle.grid.cross.down.fill" ]
    
    /// retrieve the screen size
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    func widthThatBestFits(_ cardCount: Int) -> (min: CGFloat, max: CGFloat) {
        return (width / CGFloat(selectedSize), width * 0.20)
    }
    
    /// way to declare variable
    /// colon of View -> type / var i: Int
    /// `some`: data structure something behaves like a view
    /// Lego, little building tools, small pieces gather and make it one components
    /// small block -> dining bunch -> dining room -> house
    
    /// this is actually a function !
    /// returns [Text]
    /// can write return infront of Text, but no need
    
    /// not actually stored in memory
    /// returns when the body is called : functional programming
    /// tells compiler it will return SOME VIEW and check it out with calling body
    /// to cover inside the View's what the types are
    /// `some`: would be Combiner in most of time
    var body: some View {
        let calculatedSize = widthThatBestFits(selectedSize)
        
        VStack {
            Text("Memorize!").font(.title).bold()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: calculatedSize.min, maximum: calculatedSize.max
                ))]) {
                    ForEach(shuffledEmojis(selectedSize), id: \.self) { emoji in
                        CardView(content: emoji, selectedTheme: selectedTheme)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
            
            /// buttons to change Theme style
            VStack(alignment: .leading) {
                Text("Shuffle")
                    .bold()
                HStack {
                    ForEach(0..<CardThemeStyle.allCases.count) { index in
                        Button {
                            selectedSize = Int.random(in: 4...12)
                            selectedTheme = CardThemeStyle.allCases[index]
                        } label: {
                            let isPicked = selectedTheme == CardThemeStyle.allCases[index]
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill()
                                    .foregroundColor(isPicked ? .blue : .white)
                                VStack {
                                    Image(systemName:imageDescription[index])
                                        .aspectRatio(1/1, contentMode:.fit)
                                        .foregroundColor(isPicked ? .white : .gray)
                                    Text(CardThemeStyle.allCases[index].localizedName)
                                        .font(.callout)
                                        .foregroundColor(isPicked ? .white : .gray)
                                }
                            }
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding()
                        }
                        
                        
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    
    var content: String
    var selectedTheme: CardThemeStyle
    
    var body: some View {
        ZStack {
            /// `var` vs. `let`
            /// `var`: sth gonna change
            /// `let`: used in constant variables
            /// shape does not need Type, automatically swift look at the context
            let shape = RoundedRectangle(cornerRadius: 12)
            switch selectedTheme {
            case CardThemeStyle.amberTheme:
                shape.fill().foregroundColor(.yellow)
            case CardThemeStyle.blackTheme:
                shape.fill().foregroundColor(.black)
            case CardThemeStyle.blueTheme:
                shape.fill().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            case CardThemeStyle.greenaryTheme:
                shape.fill().foregroundColor(.green)
            }
            /// set content
            Text(content)
        }
    }
}
