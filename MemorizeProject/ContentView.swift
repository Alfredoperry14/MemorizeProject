//
//  ContentView.swift
//  MemorizeProject
//
//  Created by Alfredo Perry on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["👻", "🎃", "👹", "💀","🍭","😈","🧙‍♀️","🕷️","🕸️","☠️","🫣","😱"]
    @State var cardTheme = "halloween"
    @State var cardCount = 4
    var body: some View {
        VStack{
            Text("Memorize!")
                .fontWeight(.bold)
                .font(.largeTitle)
            cards
            Spacer()
            cardCountAdjusters
                .imageScale(.large)
                .font(.largeTitle)
            
        }
        .padding()
    }
    
    
    var cards: some View{
        
        var themeColor: Color
        if(cardTheme == "halloween"){
            themeColor = .orange
        }
        else if(cardTheme == "sports"){
            themeColor = .yellow
        }
        else{
            themeColor = .teal
        }
        
        return ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
                ForEach(0..<cardCount, id: \.self){ index in
                    cardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundStyle(themeColor)
        }
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            themes
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
    
    var themes: some View{
        HStack{
            VStack{
                sportsTheme
                    .foregroundStyle(.yellow)
                    .font(.title)
            }
            Spacer()
            halloweenTheme
                .foregroundStyle(.gray)
            Spacer()
            winterTheme
                .foregroundStyle(.teal)
        }
        .padding(.horizontal)
    }
    
    func themeSelector(theme: String, emojiTheme: [String], symbol: String) -> some View{
        Button(action: {
            emojis = emojiTheme
            emojis.shuffle()
            cardTheme = theme
        }, label:{
            Image(systemName: symbol)
        })
    }
    
    var halloweenTheme: some View{
        return VStack{
            themeSelector(theme: "halloween", emojiTheme: ["👻", "🎃", "👹", "💀","🍭","😈","🧙‍♀️","🕷️","🕸️","☠️","🫣","😱"],
                                 symbol: "moon.fill")
            Text("Halloween")
                .font(.caption)
        }
    }
    
    var sportsTheme: some View {
        return VStack{
            themeSelector(theme: "sports", emojiTheme: ["🥇","⚾️","⚽️","🏀","🏈","🏋️","🏄","🧗","🎾","⛷️","🧗","🏌️‍♂️"],
                          symbol: "medal.fill")
            Text("Sports")
                .font(.caption)
        }
    }
    
    var winterTheme: some View{
        return VStack{
            themeSelector(theme:"winter", emojiTheme: ["🥶","⛸️","☃️","❄️","🛷","🧤","🎄","🎅","🏂","🧦","🧣","🎿"],
                          symbol: "snowflake")
            Text("Winter")
                .font(.caption)
        }
    }
    
    
}

struct cardView: View {
    var content: String
    @State var isFaceUp = false
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
