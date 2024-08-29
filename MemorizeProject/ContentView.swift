//
//  ContentView.swift
//  MemorizeProject
//
//  Created by Alfredo Perry on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            cardView()
            cardView(isFaceUp: true)
            cardView()
            cardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct cardView: View {
    var isFaceUp = false
    var body: some View{
        ZStack {
            if(isFaceUp){
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻")
            }
            else{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.orange)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
            }
        }
    }
}

#Preview {
    ContentView()
}
