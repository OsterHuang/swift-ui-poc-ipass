//
//  IndexBottomBar.swift
//  ipass
//
//  Created by Oster Huang on 12/01/2023.
//

import SwiftUI

struct IndexBottomBar: View {
    @Binding var selection: Int
    
    var body: some View {
        // ZStack層是為了首頁的頭可以超過上方
        ZStack {
            HStack {
                Button {
                    selection = 0
                } label: {
                    HomeMidIcon(imageName: "ic_index_ipass", label: "儲值卡", spacing: 5)
                }
                
                Button {
                    selection = 0
                } label: {
                    HomeMidIcon(imageName: "ic_index_record", label: "帳戶記錄", spacing: 5)
                }
                
                Button {
                    selection = 2
                } label: {
                    VStack(spacing: 3) {
                        ZStack {
                            Circle()
                                .fill(Color.green500)
                                .frame(width: 52, height: 52)
                            Image("ic_index_home")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        .frame(width: 48 , height: 48)
                        .offset(y: -4)
                        Text("首頁")
                            .font(.caption)
                            .foregroundColor(Color.gray600)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .offset(y: -8)
                }
                
                
                HomeMidIcon(imageName: "ic_index_account", label: "帳戶", spacing: 5)
                HomeMidIcon(imageName: "ic_index_more", label: "更多", spacing: 5)
            }
            .background(Color.white)
            .frame(height: 48)
        }
    }
}

struct IndexBottomBar_Previews: PreviewProvider {
    @State static var selectedIndex: Int = 2
    
    static var previews: some View {
        VStack {
            Spacer()
            IndexBottomBar(selection: $selectedIndex)
        }.background(Color.gray600)
    }
}
