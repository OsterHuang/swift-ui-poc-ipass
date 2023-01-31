//
//  DialogBox.swift
//  ipass
//
//  Created by Oster Huang on 31/01/2023.
//

import SwiftUI

struct DialogBox<Content: View, ButtonArea: View>: View {
    var isPresented = false
    var content: () -> Content
    var buttonArea: (() -> ButtonArea)?
    
    init(
        isPresented: Bool,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isPresented = isPresented
        self.content = content
    }
    
    init(
        isPresented: Bool,
        @ViewBuilder buttonArea: @escaping () -> ButtonArea,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isPresented = isPresented
        self.buttonArea = buttonArea
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            content()
                .padding(.bottom, 14)
            buttonArea?()
        }
        .frame(minWidth: 275)
        .padding(16)
        .background(Color.white.opacity(0.95))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.1), radius: 4)
        .scaleEffect(isPresented ? 1 : 0.4)
        .animation(.easeOut(duration: 0.3), value: isPresented)
    }
}

struct DialogBox_Previews: PreviewProvider {
    
    struct DialogBoxPureText: View {
        @State var isPresented = false
        
        var body: some View {
            ZStack {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("彈出來吧")
                }
                
                if isPresented {
                    DialogBox(
                        isPresented: isPresented,
                        buttonArea: { EmptyView() }
                    ) {
                        DialogContent<Text>("純文字測試")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "dfdfdf"))
            .onTapGesture {
                isPresented.toggle()
            }
        }
    }
    
    struct DialogBoxWithOneButton: View {
        @State var isPresented = false
        
        var body: some View {
            ZStack {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("彈出來吧")
                }
                
                if isPresented {
                    DialogBox(
                        isPresented: isPresented,
                        buttonArea: {
                            DialogOneBtn { isPresented = false }
                        }
                    ) {
                        DialogContent<Text>("純文字測試+一顆按鈕")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "dfdfdf"))
            .onTapGesture {
                isPresented.toggle()
            }
        }
    }
    
    
    static var previews: some View {
        DialogBoxPureText()
            .previewDisplayName("純文字")
        
        DialogBoxWithOneButton()
            .previewDisplayName("一顆按扭")
    }
}
