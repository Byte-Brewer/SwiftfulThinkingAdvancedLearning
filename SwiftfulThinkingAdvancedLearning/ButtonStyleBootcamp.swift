//
//  buttonStyleBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nazar Prysiazhnyi on 26.02.2023.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .brightness(configuration.isPressed ? 0.05 : 0.0)
    }
}

extension View {
    
    func withOressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Clik Me")
                .withDefaultButtonFormatting(backgroundColor: .red)
                .shadow(color: .blue.opacity(0.3),
                        radius: 10, x: 0.0, y: 10)
                
        }
        .withOressableStyle()
        .padding(40)
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
