//
//  MainPage.swift
//  ipass
//
//  Created by Oster Huang on 17/01/2023.
//

import SwiftUI

struct MainPage: View {
    @Binding var tabIndex: Int
    
    var body: some View {
        // Use ZStack, overlay to hide the tabview bottomTabBar
        ZStack {
            TabView(selection: $tabIndex) {
                HomePage()
                    .tag(2)
                IPassCardPage()
                    .tag(0)
                    
            }
        }
        .overlay(IndexBottomBar(selection: $tabIndex), alignment: .bottom)
    }
}

struct MainPage_Previews: PreviewProvider {
    @State static var tabIndex:Int = 2
    
    static var previews: some View {
        MainPage(tabIndex: $tabIndex)
    }
}
