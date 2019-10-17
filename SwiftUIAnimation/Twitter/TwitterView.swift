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
        
        .background(Color("TwitterDark"))
        
    }
}

struct TwitterCardDescription: View {
    var name: String
    var text: String
    var userName: String
    
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
            
            BottomBarButtons()
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
}

let dataModel = [
    Data(image: "ProfilePic", name: "Kenny Ho", userName: "ken_kennedy_ho", text: "Adam Neumann exited the suicide pact with $750M & everyone else gets to ride this out to its logical end, which will likely be a bankruptcy file. "),
    Data(image: "ProfilePic1", name: "The Wall Street Journal", userName: "WSJ", text: "Entrepreneur and presidential candidate Andrew Yang is proving has drummed up $10 million on the campaign trail in the past three months."),
    Data(image: "ProfilePic2", name: "The New York Times", userName: "nytimes", text: "The findings of a new study that looked at the heart of a swimmer vs. the heart of a runner underscored how sensitive our bodies are to different types of exercise."),
    Data(image: "ProfilePic3", name: "The Economist", userName: "TheEconomist", text: "Poverty alleviation has not been at the centre of either major party’s political campaigns for a long time."),
    Data(image: "ProfilePic4", name: "TechCrunch", userName: "TechCrunch", text: "India’s Udaan raises $585M to expand its B2B e-commerce platform."),
    Data(image: "ProfilePic5", name: "Bloomberg Technology", userName: "technology", text: "Tech’s most controversial startup was founded by Palmer Luckey. It makes drone-killing robots.")
]

struct NewTabBar: View {
    
    @Binding var showSetting: Bool
    @Binding var showMenu: Bool
    var size: CGFloat = 33
    
    var body: some View {
        TabView {
            TwitterHomeCell()
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


struct BottomBarButtons: View {
    @State var liked = false
    
    var body: some View {
        HStack {
            
            BottomButton(image: "message")
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)
            
            Spacer()
            BottomButton(image: "arrow.2.squarepath")
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)
            
            Spacer()
            
            BottomButton(image: self.liked ? "heart.fill" : "heart")
                .onTapGesture {
                    self.liked.toggle()
            }
                
            .animation(.easeInOut)
            .frame(width: self.liked ? 18 : 15, height: self.liked ? 18 : 15)
            .foregroundColor(self.liked ? Color.red : Color.gray)
            
            //                LottieView(filename: "TwitterLike")
            //                .frame(width: 130, height:130)
            
            Spacer()
            
            
            BottomButton(image: "tray.and.arrow.up")
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)
            
            
            Spacer()
        }
            
        .frame(height:20, alignment: .leading)
            
        .padding(.bottom, 4)
    }
}
