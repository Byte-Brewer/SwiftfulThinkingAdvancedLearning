//
//  CustomShapeBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nazar Prysiazhnyi on 05.03.2023.
//

import SwiftUI

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
}

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
}

struct Ruby: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.25
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + horizontalOffset))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + horizontalOffset))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
        }
    }
}

struct CustomShapeBootcamp: View {
    var body: some View {
        ZStack {
            Ruby()
//                .trim(from: 0, to: 0.5)
//                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10, 2, 10]))
//                .foregroundColor(.blue)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple, .red]),
                                     startPoint: .top,
                                     endPoint: .bottom))
                .frame(width: 300, height: 300)
                .onTapGesture(count: 2) {
                    print("Double tap")
                }
                .onTapGesture {
                    print("tap")
                }
        }
    }
}

struct CustomShapeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeBootcamp()
    }
}
