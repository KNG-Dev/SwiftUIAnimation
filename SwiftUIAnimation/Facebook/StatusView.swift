//
//  StatusView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/15/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

/*
Used for Facebook's Home Page. This is used for Facebook top view for Stories
*/

import SwiftUI

struct StatusView: View {
    let post: Post
    private let colors: [Color] = [Color.black.opacity(0.8), Color.gray.opacity(0)]
    
    private var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottomLeading, endPoint: .center)
    }
    
    var body: some View {
        
        ZStack {
            Image(post.image)
                .resizable()
                
                .frame(width: 150, height: 223)
                .border(Color.gray.opacity(0.5), width: 0.5)
                .cornerRadius(15)
            
            Rectangle()
                .fill(gradient).cornerRadius(15)
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    ZStack {
                        Circle().frame(width: 43, height: 43)
                            .foregroundColor(Color.blue)
                        AvatarView(image: post.user, size: 40)
                    }
                    .padding(4)
                    
                    Spacer().padding(.leading)
                }
                
                Spacer()
                HStack {
                    Text(post.user)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .padding(.leading)
                        .padding(.bottom, 4)
                    Spacer().padding(.trailing).frame(width: 10)
                }
            }
        }
    }
}
