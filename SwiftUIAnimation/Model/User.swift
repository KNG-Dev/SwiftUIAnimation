//
//  User.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/14/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    let post: Post
    let name: String
    let avatar: String
}


