//
//  ContentView.swift
//  Memorize
//
//  Created by Azamat Kenjebayev on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            MyCard(text: "A")
            MyCard(text: "B")
            MyCard(text: "C")
            MyCard(text: "D")
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}



struct MyCard: View {
    @State var isFaceUp: Bool = true
    var text: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(text)
                    .foregroundColor(.orange)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
