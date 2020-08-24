//
//  FacebookSearchBar.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 8/24/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct FacebookSearchBar: View {
    @State var show = false
    @State var txt = ""
    
    var width: CGFloat = 40
    var height: CGFloat = 40
    var name: String
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    self.show.toggle()
                }
            }) {
                Image(systemName: "magnifyingglass")
                    .frame(width:  width, height:  height)
                    
                    .cornerRadius(width / 2)
                    .padding(.leading, 8)
                
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
        .padding(.trailing)
        
    }
}

struct FacebookSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        FacebookSearchBar(name: "Kenny")
    }
}
