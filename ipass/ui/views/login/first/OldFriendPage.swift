//
//  OldFriendPage.swift
//  ipass
//
//  Created by Oster Huang on 17/01/2023.
//

import SwiftUI

struct OldFriendPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("嗨！老朋友歡迎回來！").font(.system(size: 24))
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("1. 在 LINE 錢包的頁面中，選擇 LINE Pay")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray800)
                    HStack {
                        Spacer()
                        Image("img_what_my_id_01")
                            .resizable()
                            .frame(width: 255, height: 175)
                        Spacer()
                    }
                    
                    Text("2. 選擇一卡通MONEY")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray800)
                        .padding(.top, 18)
                    HStack {
                        Spacer()
                        Image("img_what_my_id_02")
                            .resizable()
                            .frame(width: 255, height: 175)
                        Spacer()
                    }
                    
                    Text("3. 輸入密碼的畫面就會顯示您的 ID 囉!")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray800)
                        .padding(.top, 18)
                    HStack {
                        Spacer()
                        Image("img_what_my_id_03")
                            .resizable()
                            .frame(width: 255, height: 175)
                        Spacer()
                    }
                }.padding()
                
                Button {
                    
                } label: {
                    Text("我瞭解了！去登入")
                        .frame(maxWidth: .infinity , minHeight: 32)
                }.buttonStyle(PrimaryButtonStyle())
                    .padding()
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("ic_arrowleft_default")
                    }
                }
            }
        }
        .background(
            LinearGradient(
                colors: [Color(hex: "#f6f6f6"), Color(hex: "#efefef")],
                startPoint: .top, endPoint: .bottom
            )
        )
    }
}

struct OldFriendPage_Previews: PreviewProvider {
    static var previews: some View {
        OldFriendPage()
    }
}
