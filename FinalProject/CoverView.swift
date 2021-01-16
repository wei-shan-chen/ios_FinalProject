//
//  CoverView.swift
//  FinalProject
//
//  Created by User11 on 2021/1/3.
//https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3929baa183fc406a2af9c969d54a53d9&text=apple&per_page=20&format=json&nojsoncallback=1

import SwiftUI
import CoreData
import FacebookCore
import FacebookLogin
import WidgetKit

struct CoverView: View {
    @State private var moveDistance: CGFloat = -800
    @State private var opacity: Double = 0
    @State private var show = false
    @State private var rotateDegree: Double = 0
    @State private var offset = CGSize.zero
    @State var isNavigationBarHidden: Bool = true
    @State var backColor = 1
    @State private var name = ""

    var body: some View {
        NavigationView{
            ZStack{
                if backColor == 1{
                    Image("back")
                        .resizable()
                        .scaledToFill()
                }else{
                    Image("back1")
                        .resizable()
                        .scaledToFill()
                }
                
                Text("Hi ! 移 動 我 ~")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.orange)
                    .offset(x: 0, y: moveDistance)
                    .animation(
                        .spring(dampingFraction: 0.2))
                    .onAppear{
                        moveDistance = -200
                    }
                    .offset(offset)
                    .gesture(
                        DragGesture()
                            .onChanged({(value) in
                                offset = value.translation
                            })
                            .onEnded({(value) in
                                if self.moveDistance < 0 {
                                    self.foregroundColor(Color.yellow)
                                }
                            })
                    )
                TextField("你的名字", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200, height: 50, alignment: .center)
                    .offset(x: 0, y: -40)
                
                
                NavigationLink(
                    destination: Page1View()){
                    VStack {
                        if show {
                            Text("gogo----->")
                            .font(.body)
                            .fontWeight(.black)
                            .foregroundColor(Color.red)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(30)
                            .transition(.opacity)
                        }
                    }
                    .offset(x: 0, y: 30)
                    .animation(.easeInOut(duration: 5))
                    .onAppear {
                        self.show = true
                        }
                    
                    }
                .navigationBarHidden(self.isNavigationBarHidden)
                            .onAppear {
                                self.isNavigationBarHidden = true
                            }
                Button(action: {
                    let manager = LoginManager()
                    manager.logIn(permissions: [.publicProfile, .email]) { (result) in
                          if case LoginResult.success(granted: _, declined: _, token: _) = result {
                            backColor = 1
                              print("login ok")
                          } else {
                              print("login fail")
                          }
                    }
                }){
                    Text("FaceBook")
                        .font(.body)
                        .fontWeight(.black)
                        .foregroundColor(Color.blue)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(20)
                }
                .offset(x: 0, y: 100)
                
                Button(action: {
                    let message1 = AccessToken.current != nil ? "\(AccessToken.current!.userID) 登入" : "未登入"
                    print(message1)
                    let manager = LoginManager()
                    manager.logOut()
                    let message = AccessToken.current != nil ? "\(AccessToken.current!.userID) 登入" : "未登入"
                    print(message)
                    backColor = 0
                }){
                    Text("登出")
                        .font(.body)
                        .fontWeight(.black)
                        .foregroundColor(Color.black)
                }
                .offset(x: 150, y: 350)
            }
        }
    }
}
struct CoverView_Previews: PreviewProvider{
    static var previews: some View {
        CoverView()
    }
}
