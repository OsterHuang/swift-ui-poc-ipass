//
//  DialogTwoButton.swift
//  ipass
//
//  Created by Oster Huang on 31/01/2023.
//

import SwiftUI

struct DialogTwoBtn: View {
    var leftBtnText: String = "取消"
    var onLeftBtnClick : () -> Void
    
    var rightBtnText: String = "確定"
    var onRightBtnClick : () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                onLeftBtnClick()
            } label: {
            Text(leftBtnText)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(SecondaryButtonStyle())
            
            Spacer()
            
            Button {
                onRightBtnClick()
            } label: {
                Text(rightBtnText)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PrimaryButtonStyle())
        }.padding(.top, 16)
    }
}

struct DialogTwoBtn_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DialogTwoBtn {
                
            } onRightBtnClick: {
                
            }
        }.previewDisplayName("預設文字")


        VStack {
            DialogTwoBtn(
                onLeftBtnClick: {
                    
                },
                rightBtnText: "Confirm"
            ) {

            }
        }.previewDisplayName("自訂文字")
    }
}
