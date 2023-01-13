//
//  HomeIcon.swift
//  ipass
//
//  Created by Oster Huang on 11/01/2023.
//

import SwiftUI

struct HomeIcon: View {
    var imageName: String
    var imageSize: CGFloat
    var label: String
    var spacing: CGFloat = 3
    var labelColor: Color = Color.gray600
    
    var body: some View {
        VStack(spacing: spacing) {
            Image(imageName)
                .resizable()
                .frame(width: imageSize, height: imageSize)
            Text(label)
                .font(.caption)
                .foregroundColor(labelColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct HomeLargeIcon: View {
    var imageName: String
    var label: String
    var spacing: CGFloat = 3
    var labelColor: Color = Color.gray800
    
    var body: some View {
        HomeIcon(imageName: imageName, imageSize: 48, label: label, spacing: spacing, labelColor: labelColor)
    }
}

struct HomeMidIcon: View {
    var imageName: String
    var label: String
    var spacing: CGFloat = 3
    var labelColor: Color = Color.gray600
    
    var body: some View {
        HomeIcon(imageName: imageName, imageSize: 32, label: label, spacing: spacing, labelColor: labelColor)
    }
}

struct HomeIcon_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HomeLargeIcon(imageName: "ic_payment_code", label: "付款碼")
            
            HomeMidIcon(imageName: "ic_common_stored", label: "儲值")
        }
    }
}
