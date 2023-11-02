//
//  ContentView.swift
//  prStanford2023
//
//  Created by Никита Попов on 2.11.23.
//

import SwiftUI

struct ContentView: View {
    private let arrSymdols = ["🐶", "🐼", "🐸",
                              "🐰", "🐷", "🦊",
                              "🐵", "🐮", "🐻"].shuffled()
    
    var body: some View {
        ForEach(0..<3){line in
            VStack{
                HStack{
                    ForEach(0..<3){itemInLine in
                        CardPrototype(isFaceUp: false, smile: arrSymdols[line*3+itemInLine])
                        //CardPrototypeButton(isFaceUp: false, smile: arrSymdols[line*3+itemInLine])
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CardPrototype: View {
    @State var isFaceUp:Bool
    var smile: String
    var body: some View {
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 2)
                Text(smile)
                    .font(.system(size: 60))
            }else {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.yellow)
            }
            
        }
        .onTapGesture {
            self.isFaceUp.toggle()
        }
        
    }
}

struct CardPrototypeButton: View {
    @State var isFaceUp:Bool
    var smile: String
    
    var body: some View {
        Button(action: {
            self.isFaceUp.toggle()
        }, label: {
            if isFaceUp{
                Text("")
                    .font(.system(size: 50))
            }else{
                Text(smile)
                    .font(.system(size: 50))
            }
        })
        .clipShape(.rect)
        .foregroundStyle(isFaceUp ? Color.accentColor : .yellow)
        
    }
}
