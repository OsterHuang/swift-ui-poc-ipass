//
//  BannerPage.swift
//  ipass
//
//  Created by Oster Huang on 13/01/2023.
//

import SwiftUI

struct BannerPage: View {
    @State var selection = 1
    @State var currentIndex: Int = 0
    
    @State var users: [User] = []
    
    var body: some View {
        VStack {
//            PageView(selection: $selection, indexBackgroundDisplayMode: .always) {
//                ForEach(0 ..< 3, id: \.self) {
//                    self.pageView($0)
//                        .tag($0)
//                }
//            }
            
            Carousel(index: $currentIndex, items: users) {user in
                GeometryReader{ proxy in
                    
                    let size = proxy.size
                    
                    Image("oster")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                }
            }
            .padding(.vertical, 40)
            // Indicator dots
            HStack(spacing: 10){
                
                ForEach(users.indices,id: \.self){index in
                    
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 6, height: 6)
                        .scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index)
                }
            }
            .padding(.bottom,40)
            
            TabView {
                    Group {
                        self.pageView(1)
                        self.pageView(2)
                        self.pageView(3)
                    }
//                    .offset((CGFloat(selection) * -width) + (selection != 0 ? adjustMentWidth : 0) + offset)
//                }
            }
            .edgesIgnoringSafeArea(.all)
            .tabViewStyle(.page)
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: PageIndexViewStyle.BackgroundDisplayMode.interactive))
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
            
        }
        .onAppear {
            for index in 1...5{
                users.append(User(userName: "User\(index)", userImage: "user\(index)"))
            }
        }
        
    }
    
    func pageView(_ page: Int) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.yellow)
            NavigationLink(destination: Text("Page \(page)")) {
                Text("Page \(page)")
            }
        }
        .cornerRadius(5)
        .padding(.horizontal, 16)
        .shadow(radius: 5)
    }
}

struct BannerPage_Previews: PreviewProvider {
    static var previews: some View {
        BannerPage()
    }
}
