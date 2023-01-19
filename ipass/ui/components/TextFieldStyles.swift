//
//  UnderlineTextField.swift
//  ipass
//
//  Created by Oster Huang on 17/01/2023.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct UnderLineTextFieldStyle : TextFieldStyle {
    @FocusState var isFocused: Bool
    var isError: Bool = false
    
    public func _body(configuration: TextField<_Label>) -> some View {
        
        configuration
            .padding(.bottom, 10)
            .focused($isFocused)
            .background(
                UnderLine()
                    .stroke(isError && !isFocused ? Color.red500 : Color.gray500, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(alignment: .bottom)
            )
            .overlay(
                UnderLine()
                    .stroke(Color.green500.opacity(0.75), lineWidth: 2)
                    .opacity(isFocused ? 1 : 0).scaleEffect(isFocused ? 1 : 1.04)
            )
            .animation(isFocused || isError ? .easeIn(duration: 0.2) : .easeOut(duration: 0.0), value: isFocused)
    }
    
    
}

struct UnderLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}

struct UnderLineTextFieldStyle_Previews: PreviewProvider {
    @State static var someStr1: String = "Oster"
    @State static var someStr2: String = ""
    @State static var someStr3: String = ""
    
    static var previews: some View {
        VStack {
            TextField("標題", text: $someStr1, prompt: Text("輸入點東西吧"))
                .textFieldStyle(UnderLineTextFieldStyle())
            
            TextField("標題二", text: $someStr2, prompt: Text("第二個輸入框"))
                .textFieldStyle(UnderLineTextFieldStyle())
            
            TextField("標題a", text: $someStr3, prompt: Text("第a個輸入框"))
                .textFieldStyle(UnderLineTextFieldStyle(isError: true))
            
            TextField("標題三", text: $someStr2, prompt: Text("第三個輸入框"))
                .textFieldStyle(.roundedBorder)
        }.padding()
    }
}

