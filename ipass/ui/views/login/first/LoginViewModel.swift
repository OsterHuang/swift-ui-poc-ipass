//
//  LoginViewModel.swift
//  ipass
//
//  Created by Oster Huang on 18/01/2023.
//

import Foundation

/**
  * MainActor 可更新主線程
 */
@MainActor class LoginViewModel: ObservableObject {
    @Published var ipassId = ""
    @Published var ipassPw = ""
    @Published var twId = ""
    @Published var twIdError = ""
    @Published var otpCode = ""
    var otpToken = ""
    @Published var otpReceivedTime: Date? = nil
    
    @Published var isLoginPageNotActive = false
    
    init() {
        print("Init \(self)")
}
    
    deinit {
        print("deinit \(self)")
    }
    
    func backToLogin() {
        isLoginPageNotActive = true
    }
    
    func login() async -> LoginResponse? {
        do {
            var request = URLRequest(url: URL(string: "http://localhost:3000/api/auth/login")!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let loginResponse = try? decoder.decode(LoginResponse.self, from: data)
            print(loginResponse ?? "")
            
            return loginResponse
            
        } catch {
            print(error)
            
            return nil
        }
    }
    
    func checkTwId() async -> CheckTwIdResponse? {
        do {
            var request = URLRequest(url: URL(string: "http://localhost:3000/api/auth/checkTwId")!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let res = try? decoder.decode(CheckTwIdResponse.self, from: data)
            print(res ?? " CheckTwIdResponse nothing ")
            
            return res
            
        } catch {
            print(error)
            
            return nil
        }
    }
    
    func inquirySmsOtp() async -> InquiryOtpResponse? {
        do {
            var request = URLRequest(url: URL(string: "http://localhost:3000/api/auth/inquirySmsOtp")!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let res = try? decoder.decode(InquiryOtpResponse.self, from: data)
            print(res ?? " InquiryOtpResponse nothing ")
            
            if res?.rtnCode == "0000" {
                self.otpReceivedTime = Date()
                self.otpToken = res?.otpToken ?? ""
            } else {
                self.otpReceivedTime = nil
                self.otpToken = ""
            }
            
            return res
            
        } catch {
            print(error)
            
            return nil
        }
    }
}
