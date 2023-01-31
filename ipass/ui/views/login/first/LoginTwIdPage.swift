//
//  InputIdPage.swift
//  ipass
//
//  Created by Oster Huang on 18/01/2023.
//

import SwiftUI

struct LoginTwIdPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var loginViewModel: LoginViewModel
    
    @State var isInputOtpPassed = false
    
    private var _isNextEanbled: Bool {
        return loginViewModel.twId.count == 10
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("請輸入身分證字號 / 居留證統一證號")
                .font(.system(size: 14))
                .foregroundColor(Color.gray600)
            TextField("密碼", text: $loginViewModel.twId, prompt: Text("請輸入"))
                .textFieldStyle(UnderLineTextFieldStyle(isError: !loginViewModel.twIdError.isEmpty))
                .padding(.bottom, 8)
            
            Spacer()
            
            Button {
                self.next()
            } label: {
                Text("下一步")
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, minHeight: 32)
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(!_isNextEanbled)
        }
        .padding()
        .background(
            LinearGradient(
                colors: [Color(hex: "#f6f6f6"), Color(hex: "#efefef")],
                startPoint: .top, endPoint: .bottom
            )
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("ic_arrowleft_default")
                }
            }
            ToolbarItem(placement: .primaryAction) {
                Button {
                    print(loginViewModel.loginResponse ?? " Nothing for sure at LoginTwIdPage")
//                    NavigationUtil.popToRootView()
                } label: {
                    Image("ic_close_default").resizable().frame(width: 24, height: 24)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("一卡通MONEY 登入")
            }
        }
        
        // -- Navigation Triggered by program --
        NavigationLink(
            destination: LoginOtpPage(loginViewModel: loginViewModel),
//            destination: LoginOtpPage(),
            isActive: $isInputOtpPassed
        ) {
             EmptyView()
        }.hidden()
    }
    
    private func validateFields() -> Bool {
        loginViewModel.twIdError = ""
        
        if (!loginViewModel.twId.isTwId) {
            loginViewModel.twIdError = "格式錯誤"
            return false
        }
        
        return true
    }
    
    private func next() {
        if !validateFields() { return }
            
        Task {
            let res = await loginViewModel.checkTwId()
            if (res?.rtnCode == "0000") {
                self.isInputOtpPassed = true
            } else {
                Alert(
                    title: Text(res?.rtnMsg ?? "發生未知的錯誤"),
                    message: Text("Great choice!"),
                    dismissButton: .cancel()
                )
            }
        }
        
    }
    
}

struct InputIdPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginTwIdPage(loginViewModel: LoginViewModel())
        
        NavigationView {
            LoginTwIdPage(loginViewModel: LoginViewModel())
        }.previewDisplayName("With nav back")
    }
}
