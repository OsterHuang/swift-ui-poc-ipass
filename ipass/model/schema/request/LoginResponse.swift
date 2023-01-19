//
//  LoginResponse.swift
//  ipass
//
//  Created by Oster Huang on 18/01/2023.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let rtnCode, rtnMsg, errorPageURL: String?
    let count: Count?

    enum CodingKeys: String, CodingKey {
        case rtnCode, rtnMsg
        case errorPageURL
        case count
    }
}

// MARK: - Count
struct Count: Codable {
    let wrongCount, limitTryCount: Int
}
