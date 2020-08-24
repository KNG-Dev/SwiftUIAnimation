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
                }
                    
                .offset(x: 20)
                
            }
                
            .offset(x: -30)
            .frame(width: UIScreen.main.bounds.width, height: 223)
                
            .padding(.bottom)
            
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
            }.listRowBackground(Color("FacebookSecondary"))
            .frame(height: 140)
            .offset(x: -10)
            
        }
    }
}

struct FacebookHomeCell_Previews: PreviewProvider {
    static var previews: some View {
        FacebookHomeCell()
        .environment(\.colorScheme, .dark)
    }
}

struct FacebookCellButton: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
        }
        .frame(width: UIScreen.main.bounds.width / 3)
    }
}


