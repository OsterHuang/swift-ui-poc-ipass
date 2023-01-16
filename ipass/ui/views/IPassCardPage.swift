//
//  IPassCardPage.swift
//  ipass
//
//  Created by Oster Huang on 12/01/2023.
//

import SwiftUI

struct IPassCardPage: View {
//    @Binding var tabIndex: Int
    
    var fieldRows = [
        FieldRow(label:"連結一卡通儲值卡", icon: "ic_m_i_pass_manage"),
        FieldRow(label:"優惠活動", icon: "ic_m_promotions"),
        FieldRow(label:"儲值卡交易紀錄查詢", icon: "ic_m_record"),
        FieldRow(label:"普通卡記名", icon: "ic_m_card_naming"),
        FieldRow(label:"普通卡掛失", icon: "ic_m_card_missing")
    ]
    
    var body: some View {
        IndexContainer {
            TopAppBar<Text, EmptyView> { Text("一卡通儲值卡") }
                
            
            VStack(spacing: 16) {
                ForEach(fieldRows, id: \.label) { row in
                    HStack {
                        Image(row.icon).resizable().frame(width: 24, height: 24)
                        Text(row.label)
                            .font(.subheadline)
                            .foregroundColor(Color.gray800)
                        Spacer()
                        Image("ic_arrowleft_default")
                            .rotationEffect(Angle(degrees: 180))
                    }.fieldModifier()
                }
            }.padding(.horizontal, 16)
        }.background(
            LinearGradient(
                colors: [Color(hex: "#f6f6f6"), Color(hex: "#efefef")],
                startPoint: .top, endPoint: .bottom
            )
        ).navigationBarHidden(true)
    }
    
    struct FieldRow {
        var label: String
        var icon: String
    }
}

struct IPassCardPage_Previews: PreviewProvider {
    static var previews: some View {
        IPassCardPage()
    }
}
