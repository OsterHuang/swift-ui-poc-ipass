//
//  HomePage.swift
//  ipass
//
//  Created by Oster Huang on 11/01/2023.
//

import SwiftUI

struct HomePage: View {
    
    
    var body: some View {
        IndexContainer {
            ScrollView {
                VStack(spacing: 0) {
                    // Top App Bar
                    HStack {
                        Image("logo_ipass_home").resizable().frame(width: 170, height: 32)
                        Spacer()
                        Image("ic_alert")
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, -6)
                    
                    // Account Card
                    VStack {
                        MyAccountCard()
                            .padding(.horizontal, 20)
                    }
                    .frame(height: 236)
                    .background(
                        Image("bg_account_card")
                            .resizable()
                            .scaledToFill()
                    )
                    
                    // Main Function
                    HStack {
                        HomeLargeIcon(imageName: "ic_payment_code", label: "付款碼", labelColor: Color.gray800)
                        HomeLargeIcon(imageName: "ic_transfer", label: "付款碼", labelColor: Color.gray800)
                        HomeLargeIcon(imageName: "ic_vehicle_code", label: "乘車碼", labelColor: Color.gray800)
                    }
                    .padding(.bottom, 16)
                    
                    // Life Payment
                    HomeLifePayment()
                    
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

struct HomeLifePayment: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                
                Text("一卡通Money服務").font(.headline)
                
                HStack {
                    HomeMidIcon(imageName: "ic_common_stored", label: "儲值")
                    HomeMidIcon(imageName: "ic_common_lifepayment", label: "生活繳費")
                    HomeMidIcon(imageName: "ic_common_autostored", label: "自動儲值")
                    HomeMidIcon(imageName: "ic_common_promotions", label: "優惠活動")
                }
                
                Text("生活繳費(內容意思一下)").font(.headline).padding(.top)
                
                HStack {
                    HomeMidIcon(imageName: "ic_common_stored", label: "儲值")
                    HomeMidIcon(imageName: "ic_common_lifepayment", label: "生活繳費")
                    HomeMidIcon(imageName: "ic_common_autostored", label: "自動儲值")
                    HomeMidIcon(imageName: "ic_common_promotions", label: "優惠活動")
                }
                HStack {
                    HomeMidIcon(imageName: "ic_common_stored", label: "儲值")
                    HomeMidIcon(imageName: "ic_common_lifepayment", label: "生活繳費")
                    HomeMidIcon(imageName: "ic_common_autostored", label: "自動儲值")
                    HomeMidIcon(imageName: "ic_common_promotions", label: "優惠活動")
                }.padding(.top)
                HStack {
                    HomeMidIcon(imageName: "ic_common_stored", label: "儲值")
                    HomeMidIcon(imageName: "ic_common_lifepayment", label: "生活繳費")
                    HomeMidIcon(imageName: "ic_common_autostored", label: "自動儲值")
                    HomeMidIcon(imageName: "ic_common_promotions", label: "優惠活動")
                }.padding(.top)
                
                
            }.padding(20)
            Spacer()
        }
        .background(Color.white200)
        .border(width: 1, edges: [.top, .leading], color: Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(
            color: Color(.sRGBLinear, white: 0, opacity: 0.05),
            radius: 6,
            y: -6
        )
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
