//
//  CardView.swift
//  MemorizeProject
//
//  Created by Alfredo Perry on 9/14/24.
//

import SwiftUI


struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    private struct Constants{
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize{
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
    
    var body: some View{
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size:Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .modifier(Cardify(isFaceUp: card.isFaceUp))
            .opacity(card.isFaceUp || !card.isMatched ? 1:0)
    }
}


#Preview {
    VStack{
        HStack{
            CardView(MemoryGame<String>.Card(isMatched: false, content: "X", id: "test1"))
            CardView(MemoryGame<String>.Card(isFaceUp: true, isMatched: false, content: "X", id: "test1"))
        }
        HStack{
            CardView(MemoryGame<String>.Card(isFaceUp: true, isMatched: false, content: "This is a very long string and I hope it fits", id: "test1"))
            CardView(MemoryGame<String>.Card(isFaceUp: true, isMatched: false, content: "X", id: "test1"))        }
    }
    .padding()
    .foregroundColor(.green)
}
