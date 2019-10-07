//
//  MenuView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/7/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            
            MenuHomeProfile()
            MenuList()
            MenuSettings()
            Spacer()
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuHomeProfile: View {
    var body: some View {
        VStack {
            VStack {
                
                HStack {
                    Image("ProfilePic")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .background(Color.purple)
                        .cornerRadius(60 / 2)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "gear")
                    .resizable()
                    .frame(width: 30, height: 30)
                        .padding(.trailing)
                        .foregroundColor(.blue)
                }
                
                HStack {
                    TextLabel(text: "Kenny", textColor: Color.black, font: .headline, fontWeight: .semibold)
                    
                    Spacer()
                }
            
                HStack {
                    
                    TextLabel(text: "@ken_kennedy_ho", textColor: Color.gray, font: .subheadline, fontWeight: .semibold)
                    Spacer()
                }
                    
                HStack {
                    HStack {
                        Text("61 Following")
                        Text("14 Followers")
                    }
                    
                    .padding(.leading)
                    .padding(.top, 8)
                    Spacer()
                    
                }
            }
                
            .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 180, alignment: .leading)
            .background(Color.white)
            
        }
    }
}

struct MenuList: View {
    var body: some View {
        
        VStack {
            ForEach(menuData) { item in
                
                HStack {
                    Image(systemName: item.image)
                    .resizable()
//                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 24)
                        .foregroundColor(Color.gray)
                    
                    Text(item.title)
                        .padding(.leading)
                    
                    Spacer()
                }
                
                .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 60, alignment: .leading)
                .padding(.leading)
            }
        }
        
        .background(Color.white)
    }
}

struct MenuSettings: View {
    var body: some View {
        Text("")
            .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 190, alignment: .leading)
            .background(Color.green)
    }
}

struct TextLabel: View {
    var text: String
    var textColor: Color
    var font: Font
    var fontWeight: Font.Weight
    
    var body: some View {
        Text(text)
            .font(font)
            .fontWeight(fontWeight)
            .foregroundColor(textColor)
            .padding(.leading)
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

var menuData = [

    Menu(title: "Profile", image: "person"),
    Menu(title: "Lists", image: "list.dash"),
    Menu(title: "Bookmarks", image: "bookmark"),
    Menu(title: "Moments", image: "bolt"),
    
]
