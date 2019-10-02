//
//  TwitterView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/1/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct TwitterView: View {
    
    @State var state = false
    
    var body: some View {
        VStack {
            
            VStack() {
                TwitterNavBar()
                List(0 ..< 6) {item in
                    HStack(spacing: 6) {
                        
                        VStack(alignment: .leading) {
                            Text("")
                                .frame(width: 60, height: 60)
                                .background(Color.red)
                                .cornerRadius(60 / 2)
                                
                            Spacer()
                        }
                       
                        TwitterCardDescription()
                        
                    }
                }
            }
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
    var body: some View {
        return VStack(alignment: .leading, spacing: 4) {
            
            Text("Kenny Ho")
                .fontWeight(.bold)
                .font(.system(size: 22))
            
            Text("Adam Neumann exited the suicide pact with $750M & everyone else gets to ride this out to its logical end, which will likely be a bankruptcy file. ")
                .font(.body)
                .lineLimit(3)
                .frame(height: 70)
                
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
    Data(image: "ProfilePic", name: "The New York Times", text: "The findings of a new study that looked at the heart of a swimmer vs. the heart of a runner underscored how sensitive our bodies are to different types of exercise "),
    Data(image: "ProfilePic", name: "The Wall Street Journal", text: "Entrepreneur and presidential candidate Andrew Yang is proving has drummed up $10 million on the campaign trail in the past three months"),
    Data(image: "ProfilePic", name: "The Economist", text: "Poverty alleviation has not been at the centre of either major party’s political campaigns for a long time"),
    Data(image: "ProfilePic", name: "TechCrunch", text: "India’s Udaan raises $585M to expand its B2B e-commerce platform "),
    Data(image: "ProfilePic", name: "AngelList", text: "A small number of startups, spanning all stages of fundraising, are consistently recruiting employees away from big tech.")
]
