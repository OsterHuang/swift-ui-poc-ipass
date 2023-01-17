//
//  AppData.swift
//  ipass
//
//  Created by Oster Huang on 17/01/2023.
//

import Foundation

class AppData: ObservableObject {
    @Published var mainPageTabIndex: Int
    
    init(mainPageTabIndex: Int) {
        self.mainPageTabIndex = mainPageTabIndex
    }
}
