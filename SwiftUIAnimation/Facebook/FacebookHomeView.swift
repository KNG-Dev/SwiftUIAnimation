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
                .padding(.top, -10)
        }
    }
}

struct FacebookHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookHomeView()
    }
}

struct FBData: Identifiable {
    var id = UUID()
    let name: String
    let image: String
}

struct FacebookHomeMenu: View {
    @State private var selection = 0
    
    var body: some View {
        return HStack {
            Picker(selection: $selection, label: Text("Color")) {
                
                Image(systemName: "gear")
                Image(systemName: "photo.fill")
                Image(systemName: "mappin.circle.fill")
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
                Text("facebook")
                    .foregroundColor(Color.blue)
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .padding(.top, 3)
                    .padding(.leading)
                Spacer()
                
                
                FacebookMenuButton(name: "magnifyingglass")
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
            .frame(width: UIScreen.main.bounds.width + 8)
            
            
        }
            
        .frame(width: UIScreen.main.bounds.width, height: 140)
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

