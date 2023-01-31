//
//  DialogTitle.swift
//  ipass
//
//  Created by Oster Huang on 31/01/2023.
//

import SwiftUI

struct DialogTitle<Content: View>: View {
    var title: String?
    var content: (() -> Content)?
    
    init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            if content != nil {
                content?()
            } else {
                Text(title ?? "至少要帶入標題")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.gray800)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top)
    }
}

struct DialogTitle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DialogTitle {
                Text("客製的標題")
                    .font(.system(size: 32))
                Image(systemName: "star.circle.fill")
                    .resizable().frame(width: 32, height: 32)
                    .foregroundColor(Color.green500)
            }
        }
        .previewDisplayName("客製標題")
        
        VStack {
            DialogTitle<Text>("預設標題")
        }
        .previewDisplayName("預設標題")
    }
}
