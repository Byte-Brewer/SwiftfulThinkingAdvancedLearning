//
//  AnyTransitionBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nazar Prysiazhnyi on 27.02.2023.
//

import SwiftUI


struct RotationViewmidifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content.rotationEffect(Angle(degrees: rotation))
            .offset(x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                    y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
    
}

extension AnyTransition {
    
    static var rotating: AnyTransition {
        modifier(active: RotationViewmidifier(rotation: 180),
                 identity: RotationViewmidifier(rotation: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        modifier(active: RotationViewmidifier(rotation: rotation),
                 identity: RotationViewmidifier(rotation: 0))
    }
    
    static var rotateOn: AnyTransition {
        asymmetric(insertion: .rotating,
                   removal: .move(edge: .leading))
    }
    
}

struct AnyTransitionBootcamp: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
                //                    .transition(.rotating(rotation: 1080))
                //                    .transition(.rotating.animation(.easeInOut))
                
            }
            
            Spacer()
            
            Text("Click Me!")
                .withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 5.0)) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct AnyTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBootcamp()
    }
}
