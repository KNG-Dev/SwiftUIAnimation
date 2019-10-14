//
//  AvatarView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/14/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct AvatarView: View {
    let image: String
    let size: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .background(Color.red)
            .cornerRadius(size / 2)
    }
}


