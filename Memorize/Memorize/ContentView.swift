//
//  ContentView.swift
//  Memorize
//
//  Created by 이승환 on 2021/09/14.
//

import SwiftUI // imports when we build UIs

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
    
    /// swift is very strongly typed Array<String> == [String] -> swift knows when it compiles
    var emojis = ["😭", "🥺", "🧐", "😀", "😎", "🤨", "😵", "🥲", "😇"]
    /// swift informs it is Int
//    var emojiCount: Int = 6
    @State var emojiCount = 4
    
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
//        /// Kind of Views: Text, Rectangle... ?
//        /// `Combiners`, arrange in grid, stack on top, etc -> things together
//
//        /// `content` turns out to be function
//        /// returns modified ZStack
//        ZStack {
//        /// wrapping things means function
//        /// ZStack can be used like this
//
//            /// bags up to bag -> pretty simple
//            /// this arguement has label
//            /// `stroke`: only outside the edge / default : `fill`
//            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                .stroke(lineWidth: 5.0)
////                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
//            /// every View has function called [.padding()]
//            /// padding function returns something
//            /// ->  padded modified View, doesn't return Text -> Modified Text -> create new View !!
//            /// 3 different Views returned
//            Text("Hello, World!")
////                .foregroundColor(Color.orange) // another modifier
//
//            /// in sense of they are View, padding can be adjusted
//
//        }
//        .padding(.horizontal)
//        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/) // work as default
        VStack {
            ScrollView {
                // GridItem(), .flexible() is default
                // lazy of accessiing body var
                // it can be thousand of cards, accessing in View body absolutely when it is necessary
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    // bag of lego maker
                    // What is identifiable? the object must contain unique sth to identify itself
                    // Strings don't have identifying things
                    // so give `id` property like below
                    // [0..<6] not including six
                    // [0...6] including six
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            
            HStack {
                add
                Spacer() // grabs all the space
                remove
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    /// at UI portion it is all of functional programming
    /// just calling function
    /// : means behave like
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var content: String
    /// variables must have value
    /// user's value wins the default value !
    @State var isFacedUp: Bool = true // [@State] is not gonna used well
    
    var body: some View {
        ZStack {
            /// `var` vs. `let`
            /// `var`: sth gonna change
            /// `let`: used in constant variables
            /// shape does not need Type, automatically swift look at the context
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFacedUp {
                /// the way to fill inner color with ZStack
                /// cannot fill inner color with just one RoundedRectangle
                shape.fill().foregroundColor(.white)
                // fills the inner side
                shape.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            /// regular functions
            /// self property is immutable !! cannot be modified !!
            /// when the state changes it all the Views are rebuilt (it rebuilds its body)
            isFacedUp = !isFacedUp
        }
    }
}
