//
//  LoginPage.swift
//  ipass
//
//  Created by Oster Huang on 17/01/2023.
//

import SwiftUI

struct LoginPage: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 8) {
            Image("logo_ipass_login")
                .resizable().frame(width: 240, height: 48)
            
            Text("若使用過 LINE Pay Money 請用同組 ID 登入")
                .foregroundColor(Color.gray600)
                .font(.system(size: 14))
                .padding(.top, 10)
            
            HStack(alignment: .center ) {
                Image("ic_m_question")
                    .resizable().frame(width: 24, height: 24, alignment: .center)
                    .padding(0)
                
                NavigationLink {
                    OldFriendPage()
                } label: {
                    Text("如何知道我的一卡通MONEY ID是什麼?")
                        .padding(0)
                        .font(.system(size: 14))
                        .foregroundColor(Color.green500)
                }
            }.padding(.top, 10)
            
        
            LoginInputArea()
                .frame(height: 404)
                .padding(.top, 0)
            
            Spacer()
        }
        .background(
            LinearGradient(
                colors: [Color(hex: "#f6f6f6"), Color(hex: "#efefef")],
                startPoint: .top, endPoint: .bottom
            )
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("ic_arrowleft_default")
                }
            }
        }
    }
}

struct LoginInputArea: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    @State var isGoLoginTwIdPage = false
    @State var ipassId: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("bg_login")
                .resizable()
                .scaledToFill()
                .frame(width: 390, height: 328)
                .offset(y: -16)
            
            VStack(alignment:.leading, spacing: 8) {
                Text("一卡通MONEY登入ID").font(.system(size: 14))
                TextField("一卡通MONEY登入ID", text: $loginViewModel.ipassId, prompt: Text("請輸入"))
                    .textFieldStyle(UnderLineTextFieldStyle())
                    .padding(.bottom, 8)
                
                Text("密碼").font(.system(size: 14))
                TextField("密碼", text: $loginViewModel.ipassPw, prompt: Text("六位數字"))
                    .textFieldStyle(UnderLineTextFieldStyle())
                    .padding(.bottom, 8)
                
                HStack(alignment: .center) {
                    Text("忘記一卡通MONEY 登入 ID 或密碼？")
                        .foregroundColor(Color.green500)
                        .font(.system(size: 14))
                }.frame(maxWidth: .infinity)
                
                Button {
                    Task {
                        appViewModel.loadingCount += 1
                        let loginResponse = await loginViewModel.login()
                        appViewModel.loadingCount -= 1
                        self.isGoLoginTwIdPage = loginResponse?.rtnCode == "0000"
                    }
                } label: {
                    Text("登入")
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity, minHeight: 32)
                }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.top, 24)
                
                Button {
                    
                } label: {
                    Text("註冊")
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity, minHeight: 32)
                }
                    .buttonStyle(SecondaryButtonStyle())
                    .padding(.top, 8)
                
                
                
            }
            .frame(maxWidth: .infinity)
            .padding(32)
            .foregroundColor(Color.gray800)
            .background(.ultraThinMaterial)
            .border(Color.white, width: 0.3)
            .cornerRadius(20)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.17), radius: 6)
            .padding(.horizontal, 20)            
            
            NavigationLink(
                destination: LoginTwIdPage(loginViewModel: loginViewModel),
                isActive: $isGoLoginTwIdPage
            ) {
                 EmptyView()
            }.hidden()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginInputArea()
            .previewDisplayName("Login Page Input Area")
        
        LoginPage()
            .previewDisplayName("Login Page - No Nav")
        
        NavigationView {
            LoginPage()
        }
        .background(
            LinearGradient(
                colors: [Color(hex: "#f6f6f6"), Color(hex: "#efefef")],
                startPoint: .top, endPoint: .bottom
            )
        )
    }
}
