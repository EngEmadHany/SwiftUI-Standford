//
//  Cardify.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 25/01/2023.
//

import SwiftUI

struct Cardify: ViewModifier{
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            content
        }else {
            shape.fill().foregroundColor(.orange)
        }
    }
    
    
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.65
    }
}


extension View{
    func cardify(isFaceUp: Bool) -> some View{
         self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
