//
//  DialogContent.swift
//  ipass
//
//  Created by Oster Huang on 31/01/2023.
//

import SwiftUI

struct DialogContent<Content: View>: View {
    var text: String?
    var content: (() -> Content)?
    
    init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if content != nil {
                content?()
            } else {
                Text(text ?? "至少要帶入標題")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray600)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top)
    }
}

struct DialogContent_Previews: PreviewProvider {
    struct CustomizedDialogContent: View {
            @State var checked = false

            var body: some View {
                VStack {
                    DialogContent {
                        Text("客製的標題，今日可以參加抽獎")
                            .font(.system(size: 18))
                            .foregroundColor(Color.gray800)
                            
                        HStack(spacing: 6) {
                            Image(systemName: checked ? "checkmark.square.fill" : "square")
                                .resizable().frame(width: 20, height: 20)
                                .foregroundColor(checked ? Color.green500 : Color.gray600)
                                .onTapGesture {
                                    self.checked.toggle()
                                }
                            Text("下次不再顯示").foregroundColor(Color.gray600)
                        }.padding(.top)
                    }
                }
            }
        }
    
    static var previews: some View {
        CustomizedDialogContent()
            .previewDisplayName("客製彈窗內容")
        
        VStack {
            DialogContent<Text>("預設彈窗內容")
        }
            .previewDisplayName("預設彈窗內容")
    }
}
