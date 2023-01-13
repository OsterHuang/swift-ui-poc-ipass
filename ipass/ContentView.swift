//
//  ContentView.swift
//  ipass
//
//  Created by Oster Huang on 10/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabIndex: Int = 2
    
    var body: some View {
        // Use ZStack, overlay to hide the tabview bottomTabBar
        ZStack {
            TabView(selection: $tabIndex) {
                HomePage()
                    .tag(2)
                IPassCardPage(tabIndex: $tabIndex)
//                    .onBack { }
                    .tag(0)
                    
            }
        }
        .overlay(IndexBottomBar(selection: $tabIndex), alignment: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
