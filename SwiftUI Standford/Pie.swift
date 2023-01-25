//
//  Pie.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 24/01/2023.
//

import Foundation
import SwiftUI


struct Pie: Shape{
    var startingAngle: Angle
    var endAngle: Angle
    var clockWise: Bool = false
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(x: center.x + radius * CGFloat(cos(startingAngle.radians)) ,
                            y: center.y + radius * CGFloat(sin(startingAngle.radians)))
        
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startingAngle,
                 endAngle: endAngle,
                 clockwise: clockWise
        )
        p.addLine(to: center)
        return p
        
    }
  
}
