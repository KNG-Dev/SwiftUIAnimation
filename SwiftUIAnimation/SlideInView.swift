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
   @State var menuOpen: Bool = false
    
    var body: some View {
        ZStack {
            if !self.menuOpen {
                Button(action: {
                    self.openMenu()
                }, label: {
                    Text("Open")
                })
            }
            
            SideMenu(width: 270,
                     isOpen: self.menuOpen,
                     menuClose: self.openMenu)
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
