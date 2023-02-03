//
//  OtpSmsReceivedDialog.swift
//  ipass
//
//  Created by Oster Huang on 03/02/2023.
//

import SwiftUI

struct OtpSmsReceivedDialog: View {
    @Binding var isPresented: Bool
    var phoneNo: String = ""
    var onConfirm: () -> () = {}
    
    var body: some View {
        DialogView(isPresented: isPresented) {
            DialogBox(
                isPresented: isPresented,
                buttonArea: {
                    DialogOneBtn(
                        onConfirm: {
                            isPresented = false
                            onConfirm()
                        }
                    )
                }
            ) {
                DialogContent {
                    Text("驗證碼將會傳送至您在一卡通MONEY 帳戶內設定的手機號碼。")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray600)
                        .padding(.bottom)
                    Text(phoneNo)
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray800)
                }
            }
        }
    }
}

struct OtpSmsReceivedDialog_Previews: PreviewProvider {
    struct OtpSmsReceivedDialogSample: View {
        @State var isPresented = false
        @State var callbackCount = 0
        
        var body: some View {
            ZStack {
                Button {
                    isPresented = true
                } label: {
                    Text("打開來試試看")
                    Text("Confirm次數 \(callbackCount)")
                }
                
                OtpSmsReceivedDialog(isPresented: $isPresented, phoneNo: "09●●●●●537") {
                    // Callback something
                    callbackCount += 1
                }
            }
        }
    }
    
    static var previews: some View {
        OtpSmsReceivedDialogSample()
    }
}
