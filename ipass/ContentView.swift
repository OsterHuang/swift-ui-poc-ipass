//
//  ContentView.swift
//  ipass
//
//  Created by Oster Huang on 10/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appData: AppData = AppData(mainPageTabIndex: 2)
    
    var body: some View {
        MainPage(tabIndex: $appData.mainPageTabIndex)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
