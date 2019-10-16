//
//  FacebookSearch.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/15/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct FacebookSearch: View {
    @State var searchText = ""
    @State var selected = false
    
    var body: some View {

        TextField("Search Facebook", text: $searchText, onEditingChanged: { (_) in
            self.selected.toggle()
        }, onCommit: {
            self.selected.toggle()
            print(self.$searchText)
        })
            
            .background(Color.red)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
            .animation(.linear)
            .frame(width: selected ? 200 : 50)
            
        
    }
}

struct FacebookSearch_Previews: PreviewProvider {
    static var previews: some View {
        FacebookSearch()
    }
}
