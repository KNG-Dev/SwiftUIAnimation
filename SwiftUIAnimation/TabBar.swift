//
//  TabBar.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/8/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        ZStack {
            TabView {
                
                
                TwitterView().tabItem({
                    Image(systemName: "heart")
                    Text("Twitter")
                })
                    .tag(0)
                
                SlideInView().tabItem({
                    Image(systemName: "gear")
                    Text("Slide")
                })
                    .tag(1)
                
            }
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}