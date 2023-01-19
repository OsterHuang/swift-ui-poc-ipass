//
//  InputOtpPage.swift
//  ipass
//
//  Created by Oster Huang on 18/01/2023.
//

import SwiftUI

struct LoginOtpPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var loginViewModel: LoginViewModel
    @State var otpCode: String = "1234"
    
    var body: some View {
        VStack {
            HStack {
                Text("限制時間 ")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray800)
                Text("00:00")
                    .font(.system(size: 14))
                    .foregroundColor(Color.green500)
            }.padding(.bottom)
            
            
            TextField("OTP", text: $otpCode)
                .onReceive(otpCode.publisher.collect()) {
                    self.otpCode = String($0.prefix(4))
                }
                .textFieldStyle(UnderLineTextFieldStyle())
                .font(.system(size: 60))
                .frame(width: 160)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            
            Button {
                print(loginViewModel.loginResponse ?? " Nothing for sure")
            } label: {
                Text("重新取得驗證碼")
                    .font(.system(size: 12))
                    .padding(2)
            }.buttonStyle(SecondaryButtonStyle())
                .padding(.bottom, 32)
            
            Text("若您未收到驗證碼，或是輸入正確的驗證碼卻驗證失敗，請參閱 常見問題")
                .font(.system(size: 12))
                .foregroundColor(Color.gray600)
            
            Spacer()
            
            Button {
                self.next()
            } label: {
                Text("下一步")
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, minHeight: 32)
            }
            .buttonStyle(PrimaryButtonStyle())
//            .disabled(!_isNextEanbled)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("ic_arrowleft_default")
                }
            }
            ToolbarItem(placement: .primaryAction) {
                Button {
                    // NavigationUtil.popToRootView()
                    self.presentationMode.wrappedValue.dismiss()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("ic_close_default").resizable().frame(width: 24, height: 24)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("一卡通MONEY 登入")
            }
        }
    }
    
    func next() {
        
    }
}

struct InputOtpPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginOtpPage(loginViewModel: LoginViewModel())
        
        NavigationView {
            LoginOtpPage(loginViewModel: LoginViewModel())
        }.previewDisplayName("With Nav Bar")
    }
}
