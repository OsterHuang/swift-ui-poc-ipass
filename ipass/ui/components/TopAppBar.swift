//
//  TopAppBar.swift
//  ipass
//
//  Created by Oster Huang on 12/01/2023.
//

import SwiftUI

struct TopAppBar<Content: View, ActionBtn: View>: View {
    var isShowNavBack: Bool
    var title: () -> Content
    var actionBtn: (() -> ActionBtn)?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if (isShowNavBack) {
                    Button {
                    } label: {
                        Image("ic_arrowleft_default")
                    }
                } else {
                    Text("").frame(width: 32)
                }
                
                Spacer()
                title()
                Spacer()
                
                if (actionBtn != nil) {
                    actionBtn!()
                } else {
                    Text("").frame(width: 32)
                }
            }
            .frame(height: 44)
            .padding(.horizontal)
            
            TopAppBarShadow()
        }
    }
}

struct TopAppBarShadow: View {
    var body: some View {
        LinearGradient(
            colors: [Color(hex: "#e0e0e0"), Color("#e5e5ea")],
            startPoint: .top, endPoint: .bottom
        )
        .frame(height: 2)
        .padding(0)
    }
}

extension TopAppBar {
    init(
        isShowNavBack: Bool,
        @ViewBuilder title: @escaping () -> Content,
        @ViewBuilder actionBtn: @escaping () -> ActionBtn
    ) {
        self.isShowNavBack = isShowNavBack
        self.title = title
        self.actionBtn = actionBtn
    }
    
    init(
        @ViewBuilder title: @escaping () -> Content,
        @ViewBuilder actionBtn: @escaping () -> ActionBtn
    ) {
        self.isShowNavBack = true
        self.title = title
        self.actionBtn = actionBtn
    }
    
    
    init(
        @ViewBuilder title: @escaping () -> Content
    ) {
        self.isShowNavBack = true
        self.title = title
        self.actionBtn = nil
    }
    
    init(
        isShowNavBack: Bool,
        @ViewBuilder title: @escaping () -> Content
    ) {
        self.isShowNavBack = isShowNavBack
        self.title = title
        self.actionBtn = nil
    }
}

struct TopAppBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TopAppBar<Text, EmptyView>(isShowNavBack: false) {
                Text("?????????").font(.title2)
            }
            
            TopAppBar<Text, EmptyView> {
                Text("?????????").font(.title2)
            }
        
            TopAppBar<Text, Text>(isShowNavBack: false) {
                Text("?????????????????????").font(.title2)
            } actionBtn: {
                Text("Oster")
            }
            
            TopAppBar() {
                Text("???????????????").font(.title2)
            } actionBtn: {
                Button {
                } label: { Text("Btn") }
            }
            
            TopAppBar() {
                Image("logo_ipass_home").resizable().frame(width: 170, height: 32)
            } actionBtn: {
                Button {
                } label: {
                    Image("ic_close_default").resizable().frame(width: 24, height: 24)
                }
            }
            
            
            Spacer()
        }
        .background(
            Color.white
        )
    }
}
