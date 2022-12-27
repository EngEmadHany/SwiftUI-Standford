//
//  ContentView.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 08/10/2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["👩‍🚀", "👩‍🌾", "👨‍🚒", "🦸‍♀️", "🎅" , "🦊", "🐶", "🐴", "🐏", "🐇", "🐔", "🐱","🐤", "🦄", "🦋", "🦖", "🦏", "🐐", "🐩", "🌵", "🪵", "🐉", "🐲", "🐢"]
    @State var emojiCount = 4
    var body: some View{
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    ForEach( emojis[0...emojiCount], id: \.self) { emoji in
                        CardView(content: emoji, isFaceUP: true)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.padding(.horizontal)
                .foregroundColor(.red)
            Spacer()
            HStack{
                
                remove
                Spacer()
                add
                
            }.padding(.horizontal)
        }
    }
    
    
    var remove:  some View{
        Button {
            if emojiCount > 0 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
                .font(.largeTitle)
        }
    }
    
    var add: some View{
        Button {
            if emojiCount < emojis.count - 1{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                .font(.largeTitle)
        }
    }
}





struct CardView: View {
    var content: String
    @State var isFaceUP: Bool = true
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
                    .foregroundColor(.orange)
            }
        }
        .onTapGesture {
            isFaceUP.toggle()
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
