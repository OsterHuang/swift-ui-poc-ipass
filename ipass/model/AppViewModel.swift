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
    }
}
