//
//  LoginViewModel.swift
//  ipass
//
//  Created by Oster Huang on 18/01/2023.
//

import Foundation

@MainActor class LoginViewModel: ObservableObject {
    @Published var loginResponse: LoginResponse?
    @Published var isGoInputTwId = false
    
    init() {
        print("Init \(self)")
}
    
    deinit {
        print("deinit \(self)")
    }
    
    func login() async -> LoginResponse? {
        do {
            var request = URLRequest(url: URL(string: "http://localhost:3000/api/auth/login")!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            self.loginResponse = try? decoder.decode(LoginResponse.self, from: data)
            print(self.loginResponse ?? "")
            
            return loginResponse
            
        } catch {
            print(error)
            
            return nil
        }
    }
}
