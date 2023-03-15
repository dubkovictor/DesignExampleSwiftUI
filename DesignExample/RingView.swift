//
//  RingView.swift
//  DesignExample
//
//  Created by Victor on 22.01.2023.
//

import SwiftUI

struct RingView: View {
    var color1 = Color.red
    var color2 = Color.blue
    var width = 44.0
    var height = 44.0
    var percent: CGFloat = 78
    
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        return ZStack {
            Circle()
                .stroke(Color(.black).opacity(0.1),
                        style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient:
                                        Gradient(colors: [color1, color2]),
                                       startPoint: .topTrailing,
                                       endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5 * multiplier,
                                                                                     lineJoin: .round,
                                                                                     miterLimit: .infinity,
                                                                                     dash: [20, 0], dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180),
                                  axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: color2.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .foregroundColor(.black)
                .fontWeight(.bold)
        }
        
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
