//
//  MenuView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/7/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

/*
 Used for TwitterView. Presented after selection of hanbuger button. 
 */

let statusBarHeight = UIApplication.shared.statusBarFrame.height
let screen = UIScreen.main.bounds

struct MenuView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            MenuHomeProfile()
            MenuList()
            MenuSettings()
            Spacer()
                
            HStack {
                Image(systemName: "lightbulb")
                    .resizable()
//                    .aspectRatio(contentMode: .fill)
                .frame(width: 22, height: 26)
                    .foregroundColor(Color.blue)
                Spacer()
                Image(systemName: "qrcode.viewfinder")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color.blue)
            }
            
            .padding(.leading, 10)
            .padding(.trailing)
            .padding(.bottom, statusBarHeight)
        }
        .padding(.top, statusBarHeight)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color("TwitterDark"))
        .edgesIgnoringSafeArea(.all)
            
        .animation(.easeInOut(duration: 0.3))
            
        //pushes the menuView toward left by 92
        .padding(.trailing, 92)
            
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
                    
                    AvatarView(image: "ProfilePic", size: 50)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 15)
                        .foregroundColor(.blue)
                }
                
                HStack {
                    TextLabel(text: "Kenny", textColor: Color.primary, font: .headline, fontWeight: .semibold)
                    
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
//                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 24)
                        .foregroundColor(Color.gray)
                    
                    Text(item.title)
                        .padding(.leading)
                    
                    Spacer()
                }
                    
                .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 60)
                .padding(.leading, 24)
            }
            
            Divider()
                .frame(height: 0.6)
                .foregroundColor(Color("Color4"))
        }
            
        .frame(width: UIScreen.main.bounds.width - 92)
    }
}

struct MenuSettings: View {
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 25) {
                Text("Settings and privacy")
                    .font(Font.system(size: 18))
                Text("Help Center")
                    .font(Font.system(size: 18))
            }
                
            .padding()
            Spacer()
        }
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


