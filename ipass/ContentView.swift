//
//  ContentView.swift
//  ipass
//
//  Created by Oster Huang on 10/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainPage().environmentObject(IndexBottomNavigation())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
