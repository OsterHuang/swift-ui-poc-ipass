//
//  IndexContainer.swift
//  ipass
//
//  Created by Oster Huang on 12/01/2023.
//

//import SwiftUI
//
//class IndexBottomNavigation: ObservableObject {
//    @Published var actvatedTab : String? = nil // here
//}
//
//struct IndexContainer<Content: View>: View {
//    var content: () -> Content
//
//    init(@ViewBuilder content: @escaping () -> Content) {
//        self.content = content
//    }
//
//    var body: some View {
//        VStack(spacing: 0) {
//            ScrollView {
//                content()
//            }
//
//            Spacer()
//
//            IndexBottomBar().environmentObject(IndexBottomNavigation())
//        }
//    }
//}
//
//struct IndexContainer_Previews: PreviewProvider {
//    static var previews: some View {
//        IndexContainer {
//            Text("Oster")
//            Text("Oster1")
//            Text("Oster2")
//        }
//    }
//}
