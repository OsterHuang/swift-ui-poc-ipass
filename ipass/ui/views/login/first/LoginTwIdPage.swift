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
    @State var twId: String = ""
    @State var twIdError: String = ""
    
    @State var isInputOtpActived = false
    
    private var _isNextEanbled: Bool {
        return twId.count == 10
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("請輸入身分證字號 / 居留證統一證號")
                .font(.system(size: 14))
                .foregroundColor(Color.gray600)
            TextField("密碼", text: $twId, prompt: Text("請輸入"))
                .textFieldStyle(UnderLineTextFieldStyle(isError: !twIdError.isEmpty))
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
            isActive: $isInputOtpActived
        ) {
             EmptyView()
        }.hidden()
    }
    
    private func next() {
        twIdError = ""
        
        if (!twId.isTwId) {
            twIdError = "格式錯誤"
            return
        }
        
        self.isInputOtpActived = true
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
