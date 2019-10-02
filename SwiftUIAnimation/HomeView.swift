//
//  HomeView.swift
//  SwiftUITesting
//
//  Created by Kenny Ho on 9/26/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var state: HomeCardState = .normal
    @State var showButton = false
    
    var social = socialData
    
    var body: some View {
        
        ZStack {
            VStack {
                    
                TwitterButtonCardView(showButton: $showButton)
                FacebookCardView()
                TwitterCardView()

            }
        }
    }
}

struct TwitterButtonCardView: View {
    @Binding var showButton: Bool
    
    var body: some View {
        return VStack {
            Button(action: {
                self.showButton.toggle()
                
            }) {
                Image("twitterIcon")
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                
            }.sheet(isPresented: self.$showButton) {
                
                TwitterView(state: self.showButton)
                
            }
             
//            .frame(width: showButton ? UIScreen.main.bounds.width : 150, height: showButton ? UIScreen.main.bounds.height : 150 )
//            .padding(.top, showButton ? 300 : 0)
            
        }
            
        .animation(.easeInOut(duration: 0.3))
        .onAppear(perform: {
            self.background(Color.red)
        })
        .background(Color("Color2"))
        .cornerRadius(8)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TwitterCardView: View {
    @State var showTwitter = false
    @State var state: HomeCardState = .normal
    
    var body: some View {
        return HStack {
            HomeCardView(title: "Twitter", backgroundColor: showTwitter ?
                Color("Color2") : .gray, image: "twitterIcon", show: $showTwitter, state: $state)
                
                .onTapGesture {
                    
                    withAnimation(.linear(duration: 0.3)) { () 
                        self.showTwitter.toggle()
                        
                        switch self.showTwitter {
                        case true:
                            self.state = .expanded
                        case false:
                            self.state = .normal
                        }
                    }
            }
        }
    }
}

struct FacebookCardView: View {
    var twitterState = TwitterCardView(showTwitter: false, state: .hidden)
    var selectedcolor = ".green"
    @State var showFaceBook = false
    @State var state: HomeCardState = .normal
    var body: some View {
        return HStack {
            HomeCardView(title: "Facebook", backgroundColor: showFaceBook ? Color("Color3") : .gray, image: "facebookIcon", show: $showFaceBook, state: $state)
                .onTapGesture {
                    self.showFaceBook.toggle()
                    
                    switch self.showFaceBook {
                    case true:
                        self.state = .expanded
                        
                    case false:
                        self.state = .normal
                    }
            }
        }
    }
}

enum HomeCardState {
    case expanded
    case hidden
    case normal
}

struct HomeCardView: View {
    let title: String
    var backgroundColor: Color
    let image: String
    @Binding var show : Bool
    @Binding var state: HomeCardState
    
    var body: some View {
        
        return VStack {
            Image(image)
        }
            
        .animation(.easeInOut(duration: 0.3))
        .frame(width: setWidth(state), height: setHeight(state))
        .background(backgroundColor)
        .cornerRadius(8)
    
    }
    
    func setWidth(_ state: HomeCardState) -> CGFloat{
        switch state {
        case .normal:
            return 150
        case .expanded:
            return UIScreen.main.bounds.width
        case .hidden:
            return 0
        }
    }
    
    func setHeight(_ state: HomeCardState) -> CGFloat{
        switch state {
        case .normal:
            return 150
        case .expanded:
            return UIScreen.main.bounds.height * 2
        case .hidden:
            return 0
        }
    }
}

struct Social : Identifiable {
    var id = UUID()
    var title : String
    var image : String
    var backgroundColor : Color
    var state : HomeCardState
}

let socialData = [
    Social(title: "Twitter", image: "twitterIcon", backgroundColor: Color("Color2"), state: .normal),
    Social(title: "Facebook", image: "facebookIcon", backgroundColor: Color("Color3"), state: .normal),
    Social(title: "Robinhood", image: "robinhoodIcon", backgroundColor: Color("Color"), state: .normal),
    Social(title: "Snapchat", image: "snapchatIcon", backgroundColor: Color("Color1"), state: .normal)
]


                
//                HomeCardView(title: "Robinhood", backgroundColor: showRobinhood ? Color("Color") : .gray, image: "robinhoodIcon", show: $showRobinhood, state: $state)
//                    .onTapGesture {
//                        self.showRobinhood.toggle()
//                }
//
//                HomeCardView(title: "Snapchat", backgroundColor: showSnapchat ? Color("Color1") : .gray, image: "snapchatIcon", show: $showSnapchat, state: $state)
//
//                    .onTapGesture {
//                        self.showSnapchat.toggle()
//                }
            
                
                 
