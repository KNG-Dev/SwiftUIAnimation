//
//  FacebookHomeCell.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/15/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct FacebookHomeCell: View {
    var data = TestData.posts()
    
    var body: some View {
        List {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(data) { item in
                        StatusView(post: item)
                        
                    }
                        
                    .offset(x: 10)
                }
            }
                
            .frame(width: UIScreen.main.bounds.width, height: 223)
            
            ForEach(data) { item in
                VStack(alignment: .leading) {
                    HStack {
                        AvatarView(image: item.user, size: 40)
                        
                        Text(item.user)
                            .fontWeight(.heavy)
                        
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    
                    Text(item.content)
                        .lineLimit(3)
                        .padding(.trailing)
                    Spacer()
                    
                    HStack {
                        FacebookCellButton(image: "hand.thumbsup", text: "Like")
                        FacebookCellButton(image: "bubble.left", text: "Comment")
                        FacebookCellButton(image: "arrowshape.turn.up.right", text: "Share")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 40)
                    .offset(x: -20)
                    
                }
                .padding(.leading, 15)
            }
                
            .frame(height: 180)
        }
            
        .padding(.leading, -15)
    }
}
