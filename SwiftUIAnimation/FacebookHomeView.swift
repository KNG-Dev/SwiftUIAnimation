//
//  FacebookHomeView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/10/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct FacebookHomeView: View {
    
    var body: some View {
        
        VStack {
            
            FacebookTopBar()
            FacebookHomeCell()
        }
    }
}

struct FacebookHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookHomeView()
    }
}

struct FacebookHomeCell: View {
    var data = facebookData
    
    var body: some View {
        List {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(data) { item in
                        Image(item.image)
                            .frame(width: 150, height: 223)
                            .cornerRadius(15)
                        
                    }
                        
                    .offset(x: 10)
                }
            }
                
            .frame(width: UIScreen.main.bounds.width, height: 223)
            
            ForEach(data) { item in
                VStack(alignment: .leading) {
                    HStack {
                        AvatarView(image: "", size: 40)
                        
                        Text("CNBC")
                            .fontWeight(.heavy)
                        
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    
                    Text("Hello World!, My name is Kenny Ho. What days is it today deodeodeff owfejow fejofejfejfefjoef en fennncenc ewncefjjfe j feojeojf")
                        .lineLimit(3)
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

struct FBData: Identifiable {
    var id = UUID()
    let name: String
    let image: String
}

let facebookData = [
    FBData(name: "Kenny", image: "seasonPic1"),
    FBData(name: "Joe", image: "seasonPic2"),
    FBData(name: "Rachel", image: "seasonPic3"),
    FBData(name: "Rachel", image: "seasonPic4")
    
]

struct FacebookHomeMenu: View {
    @State private var selection = 0
    
    var body: some View {
        return HStack {
            Picker(selection: $selection, label: Text("Color")) {
                
                HStack {
                    
                    Image(systemName: "gear")
                    Text("Live")
                }
                
                Text("Photo")
                Text("Check In")
            }
                
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.white)
        }
    }
}

struct FacebookTopBar: View {
    var body: some View {
        VStack {
            HStack {
                Text("Facebook")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 26))
                    .padding(.top, 3)
                    .padding(.leading)
                Spacer()
                
                FacebookMenuButton(name: "gear")
                FacebookMenuButton(name: "message.circle.fill")
            }
                
            .padding(.trailing)
            
            HStack {
                AvatarView(image: "ProfilePic", size: 40)
                    .padding(.leading)
                
                Text("What's on your mind?")
                    .padding(.leading)
                Spacer()
            }
                
            .padding(.top, 6)
            
            Spacer()
            FacebookHomeMenu()
            
        }
            
        .frame(width: UIScreen.main.bounds.width, height: 140)
        .background(Color.white)
    }
}

struct FacebookMenuButton: View {
    var name: String
    
    var body: some View {
        
        Image(systemName: name)
            .frame(width: 35, height: 35)
//            .font(.system(.subheadline))
            .background(Color("Color5"))
            .cornerRadius(35 / 2)
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

struct StatusView: View {
    let data: FBData
    
    var body: some View {
        Image(data.image)
            .resizable()
            
            .frame(width: 150, height: 223)
            .border(Color.gray.opacity(1), width: 3)
            .cornerRadius(15)
        
    } 
}
