//
//  TwitterHomeCell.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/16/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI
/*
 A custom View to be used as cell for TwitterView
 */

struct TwitterHomeCell: View {
    
    var data = dataModel
    @Binding var state: Bool
    
    var body: some View {
        List(data) {item in
            NavigationLink(destination: CommentDetailView(image: item.image, name: item.name, comment: item.text, userName: item.userName, state: self.state)) {
                HStack(spacing: 6) {
                    VStack(alignment: .leading) {
                        AvatarView(image: item.image, size: 50)
                        Spacer()
                    }
                    TwitterCardDescription(name: item.name, text: item.text, userName: item.userName)
                    
                }
            }
        } 
    }
}
    
//struct TwitterHomeCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TwitterHomeCell()
////        .environment(\.colorScheme, .dark)
//    }
//}
