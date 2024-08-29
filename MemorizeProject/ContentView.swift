//
//  ContentView.swift
//  MemorizeProject
//
//  Created by Alfredo Perry on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "👹", "💀","🍭","😈","🧙‍♀️","🕷️","🕸️","☠️","🫣","😱"]
    @State var cardCount = 4
    var body: some View {
        VStack{
            cards
            Spacer()
            cardCountAdjusters
                .imageScale(.large)
                .font(.largeTitle)
        }
        .padding()
    }
    
    
    var cards: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
                ForEach(0..<cardCount, id: \.self){ index in
                    cardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(.orange)
        }
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View{
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var cardAdder: some View{
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
}



struct cardView: View {
    var content: String
    @State var isFaceUp = true
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
