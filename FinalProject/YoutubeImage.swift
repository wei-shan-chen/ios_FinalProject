//
//  YoutubeImage.swift
//  FinalProject
//
//  Created by User11 on 2021/1/6.
//https://i.ytimg.com/vi/XCBkv6myAJY/mqdefault.jpg

import SwiftUI
struct YoutubeImage: View  {
    var url: URL
    @State private var image = Image(systemName: "photo")
    @State private var downloadImageOk = false
    
    func downLoad() {
        if let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            image = Image(uiImage: uiImage)
            downloadImageOk = true
        }
    }
    var body: some View {
        image
            .resizable()
            .frame(width: 150, height: 150)
            .border(Color.pink, width: 2)
            .onAppear {
                if downloadImageOk == false {
                    downLoad()
                }
            }
    }
    
}
struct YoutubeImage_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeImage(url: URL(string: "https://i.ytimg.com/vi/XCBkv6myAJY/mqdefault.jpg")!)
    }
}
