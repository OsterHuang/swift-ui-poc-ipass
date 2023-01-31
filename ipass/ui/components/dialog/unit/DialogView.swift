//
//  DialogView.swift
//  ipass
//
//  Created by Oster Huang on 31/01/2023.
//

import SwiftUI

/**
 * 背景遮罩與中間的盒子的動畫
 */
struct DialogView<Content: View>: View {
    var isPresented: Bool
    var content: () -> Content
    
    init(
        isPresented: Bool,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isPresented = isPresented
        self.content = content
    }

    var body: some View {
        VStack {
            Spacer()

            content()

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .background {
            Color(hex: "#2f000000").edgesIgnoringSafeArea(.all)
        }
        .opacity(isPresented ? 1 : 0)
        .scaleEffect(isPresented ? 1 : 1.1)
        .animation(.easeOut(duration: 0.35), value: isPresented)
    }
}

struct DialogView_Previews: PreviewProvider {
    struct DialogViewSimpeTest: View {
        @State var isPresented = false
        
        var body: some View {
            ZStack {
                Button {
                    isPresented = true
                } label: {
                    Text("彈出來吧")
                }
                
                DialogView(isPresented: isPresented) {
                    DialogBox(
                        isPresented: isPresented,
                        buttonArea: {
                            DialogTwoBtn(
                                onLeftBtnClick: { isPresented = false },
                                onRightBtnClick: { isPresented = false }
                            )
                        }
                    ) {
                        DialogContent<Text>("這邊是預設內容的文字樣式")
                    }
                }
            }
        }
    }

    static var previews: some View {
        DialogViewSimpeTest()
    }
}
