//
//  InputOtpPage.swift
//  ipass
//
//  Created by Oster Huang on 18/01/2023.
//

import SwiftUI

struct LoginOtpPage: View {
    static let COUNT_DOWN_LIMIT = 60
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var appViewModel: AppViewModel
    @EnvironmentObject var appDialogPresentation: AppDialogPresentation
    
    @ObservedObject var loginViewModel: LoginViewModel
    @State var remainingTime: String = ""
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                Text("限制時間 ")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray800)
                Text(remainingTime)
                    .font(.system(size: 14).monospaced())
                    .frame(width: 48)
                    .foregroundColor(Color.green500)
                    .onReceive(timer) { _ in
                        everySecondTick()
                    }
            }.padding(.bottom)
            
            
            TextField("OTP", text: $loginViewModel.otpCode.max(4))
//                .onReceive(loginViewModel.otpCode.publisher.collect()) {
//                    loginViewModel.otpCode = String($0.prefix(4))
//                }
                .textFieldStyle(UnderLineTextFieldStyle())
                .font(.system(size: 60))
                .frame(width: 160)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            
            Button {
                self.inquirySmsOtp()
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
                } label: {
                    Image("ic_arrowleft_default")
                }
            }
            ToolbarItem(placement: .primaryAction) {
                Button {
                    // NavigationUtil.popToRootView()
                    UINavigationBar.setAnimationsEnabled(false)
                    self.presentationMode.wrappedValue.dismiss()
                    self.presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Image("ic_close_default").resizable().frame(width: 24, height: 24)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("一卡通MONEY 登入")
            }
        }.onAppear {
            everySecondTick()
        }
    }
    
    func inquirySmsOtp() {
        Task {
            appViewModel.loadingCount += 1
            let res = await loginViewModel.inquirySmsOtp()
            appViewModel.loadingCount -= 1
            if res?.rtnCode == "0000" {
                everySecondTick()
            }
        }
    }
    
    func everySecondTick() {
        if loginViewModel.otpReceivedTime == nil {
            self.remainingTime = "00:00"
            return
        }

        let diffSeconds = TimeInterval(LoginOtpPage.COUNT_DOWN_LIMIT) - Date().timeIntervalSince(loginViewModel.otpReceivedTime!)

        if diffSeconds <= 0 { self.remainingTime = "00:00" }
        else  {
            self.remainingTime = diffSeconds.formatMmss()
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
