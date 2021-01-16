//
//  Page1View.swift
//  FinalProject
//
//  Created by User11 on 2021/1/3.
//

import SwiftUI

struct Page1View: View {
    

    var body: some View {
        TabView{
            ZStack{
                Color.yellow
                PhotoView()
            }
            .tabItem {
                Text("cat")
                Image(systemName:"face.smiling")
            }
            
            PhotofriView()
            .tabItem {
                Text("photo")
                Image(systemName:"heart.circle")
            }
           
            YoutubeView()
            .tabItem {
                Text("makeup")
                Image(systemName:"play.circle")
            }
            SelectPhoto()
                .tabItem {
                    Text("picture")
                    Image(systemName:"plus.circle")
                }

        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Page1View()
        }
    }
}
