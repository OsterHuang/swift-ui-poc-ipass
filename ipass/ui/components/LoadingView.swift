//
//  LoadingView.swift
//  ipass
//
//  Created by Oster Huang on 19/01/2023.
//

import SwiftUI

struct LoadingView: View {
    var isShow: Bool
    
    var body: some View {
        ZStack {
            
            Color(hex: "#2f000000").edgesIgnoringSafeArea(.all)
            
            HStack(alignment: .center) {
                ProgressView("")
                    // .progressViewStyle(CircularProgressViewStyle(tint: Color.green500))
                    .scaleEffect(x: 1.2, y: 1.2, anchor: .center)
                    .offset(y: 6)
            }
            .frame(width: 80, height: 70)
            .background(Color.white.opacity(0.95))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.1), radius: 4)
        }
            .opacity(isShow ? 1 : 0)
            .scaleEffect(isShow ? 1 : 1.1)
        .animation(.easeOut(duration: 0.25), value: isShow)
    }
}

struct LoadingViewSample: View {
    @StateObject var appViewModel: AppViewModel = AppViewModel(mainPageTabIndex: 3)
    @State var name = ""
    
    var body: some View {
        
        VStack {
            Button("Toggle") {
                if appViewModel.loadingCount > 0 {
                    appViewModel.loadingCount = 0
                } else {
                    appViewModel.loadingCount = 5
                }
            }
            ZStack {
                VStack(alignment: .leading) {
                    Text("Hi")
                    TextField("Name", text: $name).textFieldStyle(UnderLineTextFieldStyle())
                    
                }.padding()
                
                LoadingView(isShow: appViewModel.loadingCount > 0)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    @State static var name = ""
    
    static var previews: some View {
        ZStack {
            Color(hex: "#ffffff").edgesIgnoringSafeArea(.all)
            LoadingViewSample()
        }.previewDisplayName("互動範例")
        
        ZStack {
            VStack(alignment: .leading) {
                Text("Hi")
                TextField("Name", text: $name).textFieldStyle(UnderLineTextFieldStyle())
                
            }.padding()
            
            LoadingView(isShow: true)
        }
        .background(Color(hex: "#ffffff").edgesIgnoringSafeArea(.all))
    }
}
