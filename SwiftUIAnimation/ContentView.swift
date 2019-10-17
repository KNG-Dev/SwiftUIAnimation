//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 9/28/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var image = "ProfilePic3"
    var name = "Kenny"
    var comment = "Comment"
    var userName = ""
    
    var body: some View {
         
        ScrollView {
            VStack {
                HStack {
                    AvatarView(image: image, size: 50)
                    VStack(alignment: .leading) {
                        Text(name)
                            .fontWeight(.semibold)
                        Text("@\(userName)")
                            .foregroundColor(Color.gray)
                        
                    }
                    Spacer()
                }
                
                .padding()
                TwitterComment(comment: comment)
                
                Divider()
                
                HStack {
                    Text("12 Retweets")
                    Text("12 Retweets")
                    Spacer()
                    
                }
                
                .padding(.leading)
                Divider()
                
                BottomBarButtons()
                    .padding(.leading, 50)
                
                Rectangle()
                    .fill(Color.orange)
                    .frame(height: 200)
                    
            }
                
                //doesnt need frame for scrollview because frame will be based off of subviews
            .background(Color("TwitterDark"))
                
        }
        
        .navigationBarTitle("Tweet")
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
        })
        
            
            .background(Color("Color5"))
            .edgesIgnoringSafeArea(.bottom)
            

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TwitterComment: View {
    var comment: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(comment)
                    .font(.title)
                .lineLimit(nil)
                    .padding()
                Spacer()
            }
            
            Spacer()
          
        }
    }
}
