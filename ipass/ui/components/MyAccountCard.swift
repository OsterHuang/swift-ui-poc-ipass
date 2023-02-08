//
//  MyAccountCard.swift
//  ipass
//
//  Created by Oster Huang on 11/01/2023.
//

import SwiftUI

struct MyAccountCard: View {
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false
    
    let durationAndDelay : CGFloat = 0.3
    
    var body: some View {
        ZStack {
            CardBack()
                .onTapGesture { flipCard() }
                .rotation3DEffect(Angle(degrees: backDegree), axis: (x: 0, y: 1, z: 0))
            
            CardFront()
                .onTapGesture { flipCard() }
                .rotation3DEffect(Angle(degrees: frontDegree), axis: (x: 0, y: 1, z: 0))
        }
    }
    
    func flipCard () {
        isFlipped.toggle()
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
}

struct CardFront: View {
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
                NavigationLink {
                    LoginPage()
                } label: {
                    Image("ic_account_card_login")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .offset(x: 6)
                }
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

struct CardBack: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            
            HStack {
                Spacer()
                Text("快速轉帳")
                    .foregroundColor(Color.gray600)
                    .font(.system(size: 14))
                Spacer()
            }
            .padding(.bottom, 11)
            .border(width: 1, edges: [.bottom], color: Color.gray300)
            
            HStack {
                Spacer()
                VStack(spacing: 0) {
                    Image("ic_xl_receipt_code")
                        .resizable()
                        .frame(width: 64, height: 64)
                    Text("收款碼")
                        .foregroundColor(Color.gray800)
                        .font(.system(size: 14, weight: .medium))
                }
                
                Divider().frame(height: 32).foregroundColor(Color.gray300)
                    .padding(.horizontal, 32)
                
                VStack(spacing: 0) {
                    Image("ic_xl_scan_code")
                        .resizable()
                        .frame(width: 64, height: 64)
                    Text("轉帳掃碼")
                        .foregroundColor(Color.gray800)
                        .font(.system(size: 14, weight: .medium))
                }
                Spacer()
            }
            .padding(.top)
            
            HStack {
                Spacer()
                Image("ic_account_card_refresh")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .offset(x: 6)
            }.offset(y: -8)
                .frame(height: 36)
            
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
