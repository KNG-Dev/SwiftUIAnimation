//
//  BottomButtonsStack.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/19/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct BottomBarButtons: View {
    @State var state = false
    
    var body: some View {
        HStack {
            
            BottomButton(image: "message")
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)
            
            Spacer()
            BottomButton(image: "arrow.2.squarepath")
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)
            
            Spacer()
            
            BottomButton(image: self.state ? "heart.fill" : "heart")
                .onTapGesture {
                    self.state.toggle()
            }
                
            .animation(.easeInOut)
            .frame(width: self.state ? 18 : 15, height: self.state ? 18 : 15)
            .foregroundColor(self.state ? Color.red : Color.gray)
            
            //                LottieView(filename: "TwitterLike")
            //                .frame(width: 130, height:130)
            
            Spacer()
            BottomButton(image: "tray.and.arrow.up")
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)
            Spacer()
        }
            
        .frame(height:20, alignment: .leading)
        .padding(.bottom, 4)
    }
}
