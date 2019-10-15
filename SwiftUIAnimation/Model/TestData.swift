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
        let post1 = Post(user: "Kenny", image: "seasonPic1", content: "Adam Neumann exited the suicide pact with $750M & everyone else gets to ride this out to its logical end, which will likely be a bankruptcy file.")
        let post2 = Post(user: "Rachel", image: "seasonPic2", content: "Entrepreneur and presidential candidate Andrew Yang is proving has drummed up $10 million on the campaign trail in the past three months")
        let post3 = Post(user: "Monica", image: "seasonPic3", content: "The findings of a new study that looked at the heart of a swimmer vs. the heart of a runner underscored how sensitive our bodies are to different types of exercise")
        let post4 = Post(user: "Phoebe", image: "seasonPic4", content: "Poverty alleviation has not been at the centre of either major party’s political campaigns for a long time")
        
        return [post1, post2,post3, post4 ]
    }
}

