//
//  SlideInView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/8/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI


//The reason that we need to create a method to toggle opening and closing the menu is so that we can change the value of menuOpen from the SideMenu view. Since structs are value types, they are immutable, so we would not be able to change the value after the SideMenu has been initialised.

struct SlideInView: View {
    @State var menuOpen = false
    
    var body: some View {
        ZStack {
            
                TabView() {
                    TwitterView().tabItem({
                        Image(systemName: "gear")
                    })
                    
                    NavigationView {
                      
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                self.openMenu()
                                
                            }) {
                                Text("Open")
                                    .frame(width: 220, height: 70)
                                    .background(Color.purple)
                                    .opacity(self.menuOpen ? 0.5 : 1.0)
                            }
                                
                            .disabled(self.menuOpen ? true : false)
                            
                        }
                            
                        .navigationBarTitle("Twitter")
                            
                    }
                    
                    .tabItem({
                        Image(systemName: "circle")
                    })
                    
                    HomeView().tabItem( {
                       Image(systemName: "heart")
                    })
                    
                    HomeView().tabItem( {
                       Image(systemName: "square")
                    })
                }
                 
            .animation(.default)
            .offset(x: menuOpen ? UIScreen.main.bounds.width - 120 : 0)
            
            SideMenu(width: 320, isOpen: self.menuOpen, menuClose: self.openMenu)
        }
    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct SlideInView_Previews: PreviewProvider {
    static var previews: some View {
        SlideInView()
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
                
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25))
                
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}

struct MenuContent: View {
    var body: some View {
        List {
            Text("My Profile").onTapGesture {
                print("My Profile")
            }
            Text("Posts").onTapGesture {
                print("Posts")
            }
            Text("Logout").onTapGesture {
                print("Logout")
            }
        }
    }
}
