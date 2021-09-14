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
        /// Kind of Views: Text, Rectangle... ?
        /// `Combiners`, arrange in grid, stack on top, etc -> things together
        
        /// `content` turns out to be function
        /// returns modified ZStack
        ZStack {
        /// wrapping things means function
        /// ZStack can be used like this
        
            /// bags up to bag -> pretty simple
            /// this arguement has label
            /// `stroke`: only outside the edge / default : `fill`
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .stroke(lineWidth: 5.0)
//                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            /// every View has function called [.padding()]
            /// padding function returns something
            /// ->  padded modified View, doesn't return Text -> Modified Text -> create new View !!
            /// 3 different Views returned
            Text("Hello, World!")
//                .foregroundColor(Color.orange) // another modifier
            
            /// in sense of they are View, padding can be adjusted
            
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/) // work as default
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
