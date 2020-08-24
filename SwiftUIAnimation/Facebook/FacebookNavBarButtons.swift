//
//  FacebookSearchBar.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 8/24/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct FacebookNavBarButtons: View {
    @State var show = false
    @State var dark = false
    
    var width: CGFloat = 40
    var height: CGFloat = 40
    var name: String
    
    var body: some View {
        HStack(spacing: 0) {
            SearchButton(show: $show)
            
            
            Button(action: {
                
                self.dark.toggle()
                UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
                
            }) {
                Image(systemName: dark ? "sun.max.fill" : "moon.fill")
                
                .frame(width:  show ? 0 : width, height:  show ? 0 : height)
                .background(Color("Color5"))
                .cornerRadius(width / 2)
                .foregroundColor(Color("Color3"))
                .padding(.leading, 8)
            }
            
            
                
        }
    }
}

struct FacebookSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        FacebookNavBarButtons(name: "Kenny")
    }
}

struct SearchButton: View {
    @Binding var show: Bool
    @State var txt = ""
    
    var width: CGFloat = 40
    var height: CGFloat = 40
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    self.show.toggle()
                }
            }) {
                Image(systemName: "magnifyingglass")
                    .frame(width:  width, height:  height)
                    .cornerRadius(width / 2)
                    .foregroundColor(Color("Color3"))
                
            }
            
            TextField("Search", text: self.$txt)
                .frame(width: show ? 200 : 0)
                .frame(height: 40)
            
            Spacer()
                //260 frame - 200 Textfield - 40 button width = 20 Spacer
                .frame(width: show ? 20 : 0)
        }
            
        .frame(width: show ? 260 : 40, height: height)
        .background(Color("Color5"))
        .cornerRadius(width / 2)
    }
}
