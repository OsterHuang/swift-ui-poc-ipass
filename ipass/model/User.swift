//
//  User.swift
//  ipass
//
//  Created by Oster Huang on 10/01/2023.
//
import Foundation
import SwiftUI

struct User: Identifiable{
    var id = UUID().uuidString
    var userName: String
    var userImage: String
}
