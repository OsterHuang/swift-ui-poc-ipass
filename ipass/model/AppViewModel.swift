//
//  AppData.swift
//  ipass
//
//  Created by Oster Huang on 17/01/2023.
//

import Foundation

class AppViewModel: ObservableObject {
    @Published var mainPageTabIndex: Int = 2
    @Published var loadingCount: Int = 0
    
    init(defaultTabIndex: Int) {
        self.mainPageTabIndex = defaultTabIndex
        
        let loadingCountSink = $loadingCount
//            .debounce(for: .seconds(5), scheduler: DispatchQueue.global())
            .sink {_ in
                print("Watch loadingCount Completed")
            } receiveValue: {
                print("Watch loadingCount: \($0)")
            }
    }
}
