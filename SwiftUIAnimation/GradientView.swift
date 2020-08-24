//
//  GradientView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 7/19/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct GradientView: View {
    @State var gradientAngle: Double = 0
    var colors = [
        Color(UIColor.systemRed),
        Color(UIColor.systemOrange),
        Color(UIColor.systemYellow),
        Color(UIColor.systemGreen),
        Color(UIColor.systemBlue),
        Color(UIColor.systemIndigo),
        Color(UIColor.systemPurple)
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: colors), center: .center, angle: .degrees(gradientAngle))
            )
                .overlay(
                    Blur(style: .systemThinMaterial)
            )
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 12).repeatForever(autoreverses: false)) {
                self.gradientAngle = 360
            }
        }
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
