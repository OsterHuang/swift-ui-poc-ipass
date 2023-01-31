//
//  CheckTwIdResponse.swift
//  ipass
//
//  Created by Oster Huang on 25/01/2023.
//

import Foundation

// MARK: - LoginResponse
struct CheckTwIdResponse: Codable {
    let rtnCode, rtnMsg, errorPageURL: String?

    enum CodingKeys: String, CodingKey {
        case rtnCode, rtnMsg
        case errorPageURL
    }
}
