//
//  ContentView.swift
//  ipass
//
//  Created by Oster Huang on 10/01/2023.
//

import SwiftUI


struct ContentView: View {
    @StateObject var appViewModel: AppViewModel = AppViewModel(defaultTabIndex: 2)
    @StateObject var appDialogPresentation = AppDialogPresentation()

    var body: some View {
        
        ZStack {
            NavigationView {
                MainPage(tabIndex: $appViewModel.mainPageTabIndex)
            }
                .environmentObject(appViewModel) // Exposed to global environment object
                .environmentObject(appDialogPresentation)

            LoadingView(isShow: appViewModel.loadingCount > 0)
            
            MessageDialog().environmentObject(appDialogPresentation)
            ConfirmDialog().environmentObject(appDialogPresentation)
        }
        .onReceive(
            appViewModel.$loadingCount.debounce(for: .milliseconds(10000), scheduler: DispatchQueue.main)
        ) {value in
            print("Watch loadingCount: \(value) over 10 second")
            if value == 0 { return }
            print("Stop loading.")
            
            appViewModel.loadingCount = 0
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
