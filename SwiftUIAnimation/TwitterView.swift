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
    var data = dataModel
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(data) {item in
                    HStack(spacing: 6) {
                        
                        VStack(alignment: .leading) {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .background(Color.red)
                                .cornerRadius(50 / 2)
                            
                            Spacer()
                        }
                        
                        TwitterCardDescription(name: item.name, text: item.text)
                            
                    }
                }
                    
                .navigationBarTitle("Home")
                    
                .navigationBarItems(
                    leading: Button(action: {
                    print("Homed Pressed")
                        self.showMenu.toggle()
                        
                    }) {
                        
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        
                        
                    }, trailing: Button(action: {
                    self.showSetting.toggle()
                    
                }) {
                    
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                })
            }
            
            .animation(.easeInOut(duration: 0.2))
            .blur(radius: self.showSetting || self.showMenu ? 20 : 0)
            
            SettingView(showSetting: $showSetting)
            MenuView(showMenu: $showMenu)
                
        }
    }
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView()
    }
}

struct TwitterNavBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        return HStack {
            
            Image("ProfilePic")
                .frame(width: 50, height: 50)
                .cornerRadius(50 / 2)
                .padding(.leading)
            
            Spacer()
            Text("Home")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 130, height: 61)
            
            Spacer()
            Button(action: {
                print("Dismissing")
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                
            }
                
            .frame(width: 80, height: 61)
            
        }
    }
}

struct TwitterCardDescription: View {
    var name: String
    var text: String
    
    var body: some View {
        return VStack(alignment: .leading, spacing: 4) {
            
            Text(name)
                .fontWeight(.bold)
                .font(.system(size: 22))
            
            Text(text)
                .font(.body)
                .lineLimit(3)
                .frame(height: 70)
            
            Spacer()
            
            HStack(spacing: 4) {
                BottomButton(image: "message")
                Spacer()
                BottomButton(image: "arrow.2.squarepath")
                Spacer()
                BottomButton(image: "heart")
                Spacer()
                
                Image(systemName: "tray.and.arrow.up")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.gray)
                Spacer()
            }
                
            .padding(.bottom, 4)
        }
    }
}

struct BottomButton: View {
    var image: String
    
    var body: some View {
        return Image(systemName: image)
            .resizable()
            .foregroundColor(.gray)
            .frame(width: 25, height: 25)
    }
}

struct Data: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var text: String
}

let dataModel = [
    Data(image: "ProfilePic", name: "Kenny Ho", text: "Adam Neumann exited the suicide pact with $750M & everyone else gets to ride this out to its logical end, which will likely be a bankruptcy file. "),
    Data(image: "ProfilePic1", name: "The Wall Street Journal", text: "Entrepreneur and presidential candidate Andrew Yang is proving has drummed up $10 million on the campaign trail in the past three months"),
    Data(image: "ProfilePic2", name: "The New York Times", text: "The findings of a new study that looked at the heart of a swimmer vs. the heart of a runner underscored how sensitive our bodies are to different types of exercise "),
    Data(image: "ProfilePic3", name: "The Economist", text: "Poverty alleviation has not been at the centre of either major party’s political campaigns for a long time"),
    Data(image: "ProfilePic4", name: "TechCrunch", text: "India’s Udaan raises $585M to expand its B2B e-commerce platform "),
    Data(image: "ProfilePic5", name: "Bloomberg Technology", text: "Tech’s most controversial startup was founded by Palmer Luckey. It makes drone-killing robots")
]
