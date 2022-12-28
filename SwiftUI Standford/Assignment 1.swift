//
//  Assignment 1.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 28/12/2022.
//

import SwiftUI

struct Assignment_1: View {
    var emojisA: [String] = ["👩‍🚀", "👩‍🌾", "👨‍🚒" ,"🦸‍♀️", "🎅" , "🦊", "🐶", "🐴", "🐏", "🐇", "🐔", "🐱","🐤", "🦄", "🦋", "🦖", "🦏", "🐐", "🐩", "🌵", "🪵", "🐉", "🐲", "🐢"]
    
   @State var emojiHome = ["figure.walk.arrival",
                     "figure.walk.departure",
                     "figure.walk.motion",
                     "homekit",
                     "house",
                     "house.fill",
                     "house.circle",
                     "house.circle.fill",
                     "lightbulb",
                     "lightbulb.fill",
                     "lightbulb.circle",
                     "lightbulb.circle.fill",
                     "lightbulb.slash",
                     "lightbulb.slash.fill",
                     "lightbulb.2",
                     "lightbulb.2.fill",
                     "lightbulb.led",
                     "lightbulb.led.fill",
                     "lightbulb.led.wide",
                     "lightbulb.led.wide.fill",
                     "fan.oscillation",
                     "fan.oscillation.fill",
                     "fanblades",
                     "fanblades.fill"]
    
    @State var emojiMedia = ["play","play.fill",
                      "play.circle","play.circle.fill",
                      "play.square",
                      "play.square.fill",
                      "play.rectangle",
                      "play.rectangle.fill",
                      "play.slash",
                      " play.slash.fill",
                      "pause",
                      "pause.fill",
                      "pause.circle",
                      "pause.circle.fill",
                      "pause.rectangle",
                      "pause.rectangle.fill",
                      "stop",
                      "stop.fill",
                      "stop.circle",
                      "stop.circle.fill",
                      "record.circle",
                      "record.circle.fill",
                      "playpause",
                      "playpause.fill"]
    
    @State var emojitransportation = ["figure.walk",
                     "figure.walk.circle",
                     "figure.walk.circle.fill",
                     "figure.walk.diamond",
                     "figure.walk.diamond.fill",
                     "figure.wave",
                     "figure.wave.circle",
                     "figure.wave.circle.fill",
                     "airplane",
                     "airplane.circle",
                     "airplane.circle.fill",
                     "airplane.arrival",
                     "airplane.departure",
                     "car",
                     "car.fill",
                     "car.circle",
                     "car.circle.fill",
                     "bolt.car",
                     "bolt.car.fill",
                     "bolt.car.circle",
                     "bolt.car.circle.fill",
                     "car.2",
                     "car.2.fill",
                     "bus"]
    
    @State var emojinature = ["globe.americas",
                       "globe.americas.fill",
                       "globe.europe.africa",
                       "globe.europe.africa.fill",
                       "globe.asia.australia",
                       "globe.asia.australia.fill",
                       "globe.central.south.asia",
                       "globe.central.south.asia.fill",
                       "sun.min",
                       "sun.min.fill",
                       "sun.max",
                       "sun.max.fill",
                       "sun.max.circle",
                       "sun.max.circle.fill",
                       "sun.max.trianglebadge.exclamationmark",
                       "sun.max.trianglebadge.exclamationmark.fill",
                       "sunrise",
                       "sunrise.fill",
                       "sunrise.circle",
                       "sunrise.circle.fill",
                       "sunset",
                       "sunset.fill",
                       "sunset.circle",
                       "sunset.circle.fill"]
    @State var emojiCounts: Int = 14
    @State var theme: [String] = ["",""]
    
    var body: some View {
        VStack{
            Text("Memorize")
                .font(.title)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    
                    ForEach(theme ,id: \.self) { emoji in
                        CardViewA(content:emoji)
                            .aspectRatio(2/3 , contentMode: .fit)
                    }
                    
                }
            }
            Spacer()
            HStack{
                veichels
                
                media
                
                home
                
                nature
            }.padding(.horizontal)
        }.padding(.horizontal)
        
    }
    
    var veichels: some View{
        Button {
            emojitransportation.shuffle()
            self.theme = Array(emojitransportation[0...getRandome()])
        } label: {
            VStack{
                Image(systemName: "car")
                    .font(.title)
                
                Text("Transportation")
                    .font(.caption)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
            }.padding(.horizontal)
        }
    }
    
    var media: some View{
        Button {
            emojiMedia.shuffle()
            self.theme = Array(emojiMedia[0...getRandome()])
        } label: {
            VStack(alignment: .leading){
                Image(systemName: "playpause")
                    .font(.title)
                
                Text("Media")
                    .font(.caption)
                
            }.padding(.horizontal)
        }
    }
    
    var home: some View{
        Button {
            emojiHome.shuffle()
            self.theme = Array(emojiHome[0...getRandome()])
        } label: {
            VStack{
                Image(systemName: "house")
                    .font(.title)
                
                Text("Home")
                    .font(.caption)
            }.padding(.horizontal)
        }
    }
    
    var nature: some View{
        Button {
            emojinature.shuffle()
            self.theme = Array(emojinature[0...getRandome()])
        } label: {
            VStack{
                Image(systemName: "leaf")
                    .font(.title)
                
                Text("Nature")
                    .font(.caption)
            }.padding(.horizontal)
        }
    }
    
    func getRandome() -> Int{
        let randomCards = Int.random(in: 4...23)
        return randomCards
    }
}



struct CardViewA: View {
    var content: String
    @State var isFaceUP: Bool = true
    
    var body: some View {
        ZStack{
            if isFaceUP{
                RoundedRectangle(cornerRadius: 13)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 13)
                    .strokeBorder(lineWidth: 3)
                    .foregroundColor(.orange)
                Image(systemName: content)
                    .font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 13)
                    .fill(.orange)
            }
        }
        .onTapGesture {
            isFaceUP.toggle()
        }
    }
}


struct Assignment_1_Previews: PreviewProvider {
    static var previews: some View {
        Assignment_1()
            .preferredColorScheme(.light)
    }
}
