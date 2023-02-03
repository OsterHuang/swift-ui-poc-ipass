//
//  InquiryOtpResponse.swift
//  ipass
//
//  Created by Oster Huang on 03/02/2023.
//

import Foundation

struct InquiryOtpResponse: Codable {
    let rtnCode, rtnMsg, errorPageURL, otpToken: String?

    enum CodingKeys: String, CodingKey {
        case rtnCode, rtnMsg, errorPageURL, otpToken
    }
}
