//
//  PrimaryButton.swift
//  ipass
//
//  Created by Oster Huang on 17/01/2023.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .font(.system(size: 16))
            .background(isEnabled ? Color.green500 : Color.gray300)
            .foregroundColor(Color.white)
            .clipShape(RoundedCorner(radius: 10))
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .font(.system(size: 16))
            .background(Color.white)
            .foregroundColor(Color.green500)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green500, lineWidth: 2)
            )
            .clipShape(RoundedCorner(radius: 10))
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button{} label: {
                Text("Primary Button")
                    .frame(height: 32)
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button{} label: {
                Text("Primary Button (Disabled)")
                    .frame(height: 32)
            }
            .disabled(true)
            .buttonStyle(PrimaryButtonStyle())
            
            Button{} label: {
                Text("Secondary Button")
                    .frame(height: 32)
            }
            .buttonStyle(SecondaryButtonStyle())
        }
    }
}
