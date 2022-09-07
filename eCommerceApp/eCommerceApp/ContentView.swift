//
//  ContentView.swift
//  eCommerceApp
//
//  Created by Shilpee Gupta on 06/09/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            Products()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Products")
                }
            
//            Orders()
//                .tabItem {
//                    Image(systemName: "cart.fill")
//                    Text("Orders")
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
