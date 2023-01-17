//
//  MainPageNavBar.swift
//  ipass
//
//  Created by Oster Huang on 16/01/2023.
//

import SwiftUI

struct MainPageNavBar<Content: View>: View {
    private let content: () -> Content
    
    init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                content()
            }
            .frame(height: 44)
            .padding(.horizontal)
            
            
            LinearGradient(
                colors: [Color(hex: "#e0e0e0"), Color("#e5e5ea")],
                startPoint: .top, endPoint: .bottom
            )
               .frame(height: 2)
               .padding(0)
        }
    }
}

struct MainPageNavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MainPageNavBar {
                Button {
                } label: {
                    Image("ic_arrowleft_default").frame(width: 24, height: 24)
                }
                
                Spacer()
                Text("This is example").font(.title2)
                Spacer()
                
                Button {
                } label: {
                    Image("ic_close_default").resizable().frame(width: 24, height: 24)
                }
            }
            
            
            MainPageNavBar {
                Button {
                } label: {
                    Image("ic_arrowleft_default")
                }
                
                Spacer()
                Text("This is example").font(.title2)
                Spacer()
                
                Text("").frame(width: 24)
            }
            
            Spacer()
        }
    }
}
