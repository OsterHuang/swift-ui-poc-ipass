//
//  DialogOneBtn.swift
//  ipass
//
//  Created by Oster Huang on 31/01/2023.
//

import SwiftUI

struct DialogOneBtn: View {
    var text: String = "確定"
    var onConfirm: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                onConfirm()
            } label: {
                Text(text)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PrimaryButtonStyle())
        }.padding(.top, 16)
    }
}

struct DialogOneBtn_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DialogOneBtn {}
        }.previewDisplayName("預設文字")

        
        VStack {
            DialogOneBtn(
                text: "Confirm"
            ) {
                
            }
        }.previewDisplayName("自訂文字")
    }
}
