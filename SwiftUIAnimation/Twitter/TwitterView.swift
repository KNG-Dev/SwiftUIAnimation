//
//  TwitterView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/1/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct TwitterView: View {
    
    @State var showSetting = false
    @State var showMenu = false
    @State var state = false
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                NewTabBar(showSetting: $showSetting, showMenu: $showMenu)
                
            }
              .background(Color.orange)
            .offset(x: showMenu ? UIScreen.main.bounds.width - 92 : 0)
            .animation(.easeInOut(duration: 0.3))
            
            GeometryReader { _ in
                EmptyView()
            }
                
            .background(Color.black.opacity(0.3))
            .opacity(self.showSetting ? 1 : 0)
            .animation(.easeOut(duration: 0.2))
            .edgesIgnoringSafeArea(.all)
                
            .onTapGesture {
                self.showSetting.toggle()
            }
            
            
            GeometryReader { _ in
                EmptyView()
            }
                
            .background(Color.black.opacity(0.3))
            .opacity(self.showMenu ? 1 : 0)
            .animation(.easeInOut(duration: 0.2))
            .edgesIgnoringSafeArea(.all)
                
            .onTapGesture {
                self.showMenu.toggle()
            }
            
            //            .blur(radius: self.showSetting || self.showMenu ? 20 : 0)
            SettingView(showSetting: $showSetting)
            MenuView(showMenu: $showMenu)
                
        }
    }
}

struct TwitterCardDescription: View {
    var name: String
    var text: String
    var userName: String
    @State var state = false
    
    var body: some View {
        return VStack(alignment: .leading, spacing: 4) {
            
            HStack {
                Text(name)
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                
                Text("@\(userName)")
                    .font(.body)
                    .foregroundColor(Color("Color4"))
                
            }
            Text(text)
                .font(.body)
                .frame(minHeight: 70)
                .lineLimit(nil)
            
            Spacer()
            BottomBarButtons(state: state)
        }
    }
}

struct BottomButton: View {
    var image: String
    
    var body: some View {
        return Image(systemName: image)
            .resizable()
    }
}

struct Data: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var userName: String
    var text: String
    var liked: Bool
}

let dataModel = [
    Data(image: "ProfilePic", name: "Kenny Ho", userName: "ken_kennedy_ho", text: "Adam Neumann exited the suicide pact with $750M & everyone else gets to ride this out to its logical end, which will likely be a bankruptcy file. ", liked: false),
    Data(image: "ProfilePic1", name: "The Wall Street Journal", userName: "WSJ", text: "Entrepreneur and presidential candidate Andrew Yang is proving has drummed up $10 million on the campaign trail in the past three months.", liked: false),
    Data(image: "ProfilePic2", name: "The New York Times", userName: "nytimes", text: "The findings of a new study that looked at the heart of a swimmer vs. the heart of a runner underscored how sensitive our bodies are to different types of exercise.", liked: false),
    Data(image: "ProfilePic3", name: "The Economist", userName: "TheEconomist", text: "Poverty alleviation has not been at the centre of either major party’s political campaigns for a long time.", liked: false),
    Data(image: "ProfilePic4", name: "TechCrunch", userName: "TechCrunch", text: "India’s Udaan raises $585M to expand its B2B e-commerce platform.", liked: false),
    Data(image: "ProfilePic5", name: "Bloomberg Technology", userName: "technology", text: "Tech’s most controversial startup was founded by Palmer Luckey. It makes drone-killing robots.", liked: false)
]

struct NewTabBar: View {
    
    @Binding var showSetting: Bool
    @Binding var showMenu: Bool
    var size: CGFloat = 33
    @State var state = false
    
    var body: some View {
        TabView {
            TwitterHomeCell(state: $state)
            SearchView()
            .tabItem({
                Image(systemName: "magnifyingglass")
                Text("Search")
            })
        }
             
        .navigationBarTitle("Home", displayMode: .inline)
        .navigationBarItems(
            leading: Button(action: {
                print("Homed Pressed")
                self.showMenu.toggle()
                
            }) {
                Image("ProfilePic").renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .animation(.easeIn(duration: 0.2))
                    .frame(width:self.showMenu ? 0 : size, height: self.showMenu ? 0 : size)
                    .cornerRadius(size / 2)
                    .background(Color.clear)
                    .padding(.leading, 4)
                
            }, trailing: Button(action: {
                self.showSetting.toggle()
                
            }) {
                
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: size, height: size)
                
        })
    }
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView()
//            .environment(\.colorScheme, .dark)
    }
}

