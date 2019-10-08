//
//  SettingView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/3/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @Binding var showSetting: Bool
    
    var body: some View {
        
        VStack {
            Rectangle()
                .frame(width: 35, height: 5)
                .cornerRadius(3)
                .padding(.top)
                .foregroundColor(Color("Color4"))
            
            Image("TwitterStar")
                .frame(width: 60, height: 60)
            
            SettingList()
            
            Button(action: {
                print("Dismiss")
                self.showSetting.toggle()
                
            }) {
                Text("Cancel")
                .frame(width: UIScreen.main.bounds.width - 40, height: 48)
                .background(Color(red: 230/255, green: 236/255, blue: 239/255))
                .cornerRadius(30)
            }
            
            
            Spacer()
        }
        
        .background(Color.white)
        
        
        .cornerRadius(20)
            .animation(.easeInOut(duration: 0.3))
            .offset(x: 0, y: showSetting ? UIScreen.main.bounds.height / 1.6 : UIScreen.main.bounds.height)
        
        
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}

struct Setting: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let settingData = [
    Setting(title: "Setting latest Tweets instead", icon: "arrow.right.arrow.left"),
    Setting(title: "View content preferences", icon: "gear")
]

struct SettingList: View {
   var setting = settingData
     
    var body: some View {
        return VStack {
                ForEach(setting) { item in
                    HStack {
                        Image(systemName: item.icon)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color("Color4"))
                            .padding(.leading, 24)
                        Text(item.title)
                            .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                }
                .frame(height: 40)
        }
        
        
        
    }
}
