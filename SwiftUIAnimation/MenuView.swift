//
//  MenuView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/7/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            MenuHomeProfile()
            MenuList()
            MenuSettings()
            Spacer()
            
        }
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        
        .animation(.default)
        .padding(.trailing, 90)
            
        .animation(.easeInOut(duration: 0.3))
        .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
        
        .onTapGesture {
            self.showMenu.toggle()
        }
    
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
                        .cornerRadius(60 / 2)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 15)
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
                        .foregroundColor(Color.black)
                    
                    Spacer()
                }
                    
                .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 60)
                .padding(.leading, 24)
            }
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 90, height: 0.6)
                .foregroundColor(Color("Color4"))
        }
            
        .frame(width: UIScreen.main.bounds.width - 90)
        .background(Color.white)
    }
}

struct MenuSettings: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Settings and privacy")
                .foregroundColor(Color.black)
                .font(Font.system(size: 18))
            Text("Help Center")
                .foregroundColor(Color.black)
                .font(Font.system(size: 18))
        }
             
        .padding(.trailing, 130)
        .frame(width: UIScreen.main.bounds.width - 90, height: 120)
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


