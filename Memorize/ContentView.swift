//
//  ContentView.swift
//  Memorize
//
//  Created by Yip Kwun Chuen on 2024/9/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            // default as false
            CardView()
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        if isFaceUp {
            ZStack{
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 3)
                Text("💩").font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: 12)
        }
        
    }
}


#Preview {
    ContentView()
}
