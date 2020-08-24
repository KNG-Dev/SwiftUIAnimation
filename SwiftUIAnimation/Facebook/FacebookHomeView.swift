//
//  FacebookHomeView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/10/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct FacebookHomeView: View {
    @Binding var show: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            FacebookTopBar(show: $show)
                .padding(.top, 50)
                .background(Color("FacebookPrimary"))
            
            FacebookHomeCell()
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct FacebookHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookHomeView(show: .constant(false))
//            .environment(\.colorScheme, .dark)
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
            
            
                .background(Color("FacebookPrimary"))
            .pickerStyle(SegmentedPickerStyle())
            
        }
    }
}

struct FacebookTopBar: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("facebook")
                    .foregroundColor(Color.blue)
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .padding(.leading)
                Spacer()
                
                HStack {
                    if self.show == false {
                        FacebookNavBarButtons(name: "Search")
                    }
                }
                .padding(.trailing)
            }
            
            HStack {
                AvatarView(image: "ProfilePic", size: 40)
                
                Text("What's on your mind?")
                Spacer()
            }
            
            .padding(.leading)

            FacebookHomeMenu()
                .frame(width: UIScreen.main.bounds.width + 8)
                .edgesIgnoringSafeArea(.all)
            
        }
    }
}



