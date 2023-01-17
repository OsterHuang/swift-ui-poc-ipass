//
//  MyAccountCard.swift
//  ipass
//
//  Created by Oster Huang on 11/01/2023.
//

import SwiftUI

struct MyAccountCard: View {
    var body: some View {
        VStack(alignment:.leading) {
            
            HStack {
                Text("一卡通MONEY 餘額")
                    .foregroundColor(Color.gray600)
                    .font(.caption)
                Image("ic_eyeclose")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            Text("NT $ ******")
                .font(.title)
                .frame(height: 49, alignment: .center)
                .padding(.top, 16)
            
            HStack {
                Text("帳號")
                    .foregroundColor(Color.gray600)
                    .font(.caption)
                Text("********")
                    .foregroundColor(Color.gray600)
                    .font(.caption)
                Spacer()
                Image("ic_account_card_login")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .offset(x: 6)
            }
            .padding(.top, 6)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.top, 24)
        .padding(.bottom, 16)
        .background(.ultraThinMaterial)
        .border(Color.white, width: 0.3)
        .cornerRadius(20)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.17), radius: 6)
    }
}

struct MyAccountCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MyAccountCard()
        }
    }
}
