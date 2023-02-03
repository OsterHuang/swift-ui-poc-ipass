//
//  ContentView.swift
//  ipass
//
//  Created by Oster Huang on 10/01/2023.
//

import SwiftUI


struct ContentView: View {
    @StateObject var appViewModel: AppViewModel = AppViewModel(mainPageTabIndex: 2)
    @StateObject var appDialogPresentation = AppDialogPresentation()

    var body: some View {
        
        ZStack {
            NavigationView {
                MainPage(tabIndex: $appViewModel.mainPageTabIndex)
            }.onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.shadowColor = nil // or a custom tint color
                appearance.shadowImage = UIImage(named: "shadow")
                UINavigationBar.appearance().standardAppearance = appearance
            }
                .environmentObject(appViewModel) // Exposed to global environment object
                .environmentObject(appDialogPresentation)

            LoadingView(isShow: appViewModel.loadingCount > 0)
            
            MessageDialog().environmentObject(appDialogPresentation)
            ConfirmDialog().environmentObject(appDialogPresentation)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
