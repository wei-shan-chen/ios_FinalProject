//
//  PhotofriView.swift
//  FinalProject
//
//  Created by User11 on 2021/1/6.
//e20e0c307549913cf7307e10ad9f9792
import Foundation
import SwiftUI
import UIKit
import WaterfallGrid
import URLImage

struct PhotofriView: View {
    @State var photos = [Photo]()
    @State private var brightness=[Double](repeating: 0.0, count: 200)
    func fetchData() {
    
        if let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=e20e0c307549913cf7307e10ad9f9792&text=Seven+Sisters&per_page=20&format=json&nojsoncallback=4") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    
                    do {
                        let searchData   = try JSONDecoder().decode(SearchData.self, from: data)
                        self.photos = searchData.photos.photo
                        print(self.photos)

                    } catch  {
                        print(error )
                    }
                }
                else {
                    print("error")
                }
            }
            task.resume()
        }
        
    }
    var body: some View {
     
            ScrollView(showsIndicators:false){
               /* WaterfallGrid((0..<10), id: \.self) { index in
                    PhototfriImageView(
                        url:photos[index].imageUrl).aspectRatio(contentMode: .fit)
                }*//*
                VStack {
                    if photos.count > 0 {
                        ForEach(0..<10){(index) in
                            HStack{
                                PhototfriImageView(url: photos[index].imageUrl)
                                PhototfriImageView(url: photos[index+10].imageUrl)
                            }
                    
                        }

                    }
                }*/
                
                 if photos.count > 0 {
                     WaterfallGrid(photos.indices, id: \.self) { index in
                        
                        URLImage(url:photos[index].imageUrl,
                                 content: {image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        //.border(Color.white, width: 2)
                                        
                                 })
                        
                        //PhototfriImageView(url: photos[index].imageUrl)
                         //.aspectRatio(contentMode: .fit)
                     }
                     .gridStyle(spacing: 5,animation: .easeInOut(duration: 2))
                     .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                 }
                 
            }
            .background(Color(red: 1, green: 0.6, blue: 0.6)).cornerRadius(20)
            .onAppear(perform: {
                fetchData()
            })
      
    }
}

struct PhotofriView_Previews: PreviewProvider {
    static var previews: some View {
        PhotofriView()
    }
}
