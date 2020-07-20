//
//  TestData.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/15/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct TestData {
    
    static func posts() -> [Post] {
        let post1 = Post(user: "Ross", image: "seasonPic1", content: "We were on a BREAK!")
        let post6 = Post(user: "Rachel", image: "seasonPic2", content: "Ahhh, salmon skin roll.")
        let post3 = Post(user: "Monica", image: "seasonPic3", content: "And remember, if I'm harsh with you, it's only because you're doing it wrong.")
        let post4 = Post(user: "Phoebe", image: "seasonPic4", content: "I drink because the more I drink, the less there is for kids to drink.")
        let post5 = Post(user: "Joey", image: "seasonPic4", content: "Why God why!? we had a deal! Let the others grow old, not me!")
        let post2 = Post(user: "Chandler", image: "seasonPic4", content: "I'm full, and yet I know if I stop eating this, I'll regret it.")
        
        return [post1, post2,post3, post4, post5, post6 ]
    }
}

