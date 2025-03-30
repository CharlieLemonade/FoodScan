//
//  CurveSideRectangle.swift
//  AppFoodScan
//
//  Created by Carlos López on 15/03/25.
//

import SwiftUI

struct CurvedSideRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        /*path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.maxY + 100))
        path.closeSubpath()*/
        
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: 0),
                          control: CGPoint(x: rect.midX, y: rect.midX - 175))
        
        
        
        path.closeSubpath()
        return path
    }
}

struct CurvedSideRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangle()
            .frame(height: 500)
    }
}
