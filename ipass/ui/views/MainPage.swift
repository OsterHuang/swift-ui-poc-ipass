//
//  MainPage.swift
//  ipass
//
//  Created by Oster Huang on 16/01/2023.
//

import SwiftUI

class IndexBottomNavigation: ObservableObject {
    @Published var actvatedTab : String? = "HomePage" // here
}

struct MainPage: View {
    @EnvironmentObject var indexBottomNavigation: IndexBottomNavigation
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                if (actvatedTab =)
            }
            
            Spacer()
            
            IndexBottomBar().environmentObject(IndexBottomNavigation())
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
