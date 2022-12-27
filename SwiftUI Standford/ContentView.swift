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
            CardView()
            CardView()
            CardView()
            CardView()
            
        }.padding(.horizontal)
         .foregroundColor(.red)
    }
}





struct CardView: View {
    var body: some View {
        ZStack(){
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                
            Text("✈️")
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
