//
//  ContentView.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 08/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View{
        HStack{
            CardView(isFaceUP: true)
            CardView(isFaceUP: false)
            CardView(isFaceUP: true)
            CardView(isFaceUP: false)
            
        }.padding(.horizontal)
         .foregroundColor(.red)
    }
}





struct CardView: View {
    var isFaceUP: Bool = true
    
    var body: some View {
        ZStack{
            var shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                
                Text("✈️")
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
                    .foregroundColor(.orange)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
