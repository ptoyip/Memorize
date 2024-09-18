//
//  ContentView.swift
//  Memorize
//
//  Created by Yip Kwun Chuen on 2024/9/17.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["💩", "👻", "🦁", "🐱", "🐶", "🐻‍❄️", "🐯", "🐸"]
    
    @State var cardCount: Int = 2
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardAdjusters
        }.padding()
    }
    
    var cardAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            // we can use 0..<4 to represent 0 - 4(not included)
            // and 0...4 to represent 0 - 4(included)
            // also using emogis.incides to represent length
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: emojis[index])
            }
            .aspectRatio(2/3 , contentMode: .fit)
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        return cardCountAdjusters(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        return cardCountAdjusters(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
}

struct CardView: View {
    // 透過加\@State可以令到isFaceUp呢個View暫時改變
    @State var isFaceUp = true
    // 因為冇default，所以直接寫let
    let content: String
    
    var body: some View{
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack{
            Group{
                base.foregroundColor(.white)
                base.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
