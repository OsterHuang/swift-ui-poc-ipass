//
//  BindingExt.swift
//  ipass
//
//  Created by Oster Huang on 03/02/2023.
//

import Foundation
import SwiftUI

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}
