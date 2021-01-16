//
//  PhotoView.swift
//  FinalProject
//
//  Created by User11 on 2021/1/4.
//

import SwiftUI
import UIKit

struct PhotoView: View {
    @ObservedObject var photowindow0:Photowindow
    @ObservedObject var photowindow1:Photowindow
    @ObservedObject var photowindow2:Photowindow
    @ObservedObject var photowindow3:Photowindow
    @State var image:UIImage = UIImage()
    @State private var page = 0
    //@State private var nowPage = 0
    init(){
        photowindow0 = Photowindow(page:0)
        photowindow1 = Photowindow(page:0)
        photowindow2 = Photowindow(page:0)
        photowindow3 = Photowindow(page:0)
     
    }
    var body: some View {
        VStack{
            HStack{
                Image(uiImage:photowindow0.data != nil ? UIImage(data: photowindow0.data!)!:UIImage()).resizable().scaledToFit()
                Image(uiImage:photowindow1.data != nil ? UIImage(data: photowindow1.data!)!:UIImage()).resizable().scaledToFit()
            }
            
            HStack{
                Image(uiImage:photowindow2.data != nil ? UIImage(data: photowindow2.data!)!:UIImage()).resizable().scaledToFit()
                Image(uiImage:photowindow3.data != nil ? UIImage(data: photowindow3.data!)!:UIImage()).resizable().scaledToFit()
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}

class Photowindow: ObservableObject{
    @Published var data:Data?
    var page:Int
    init(page:Int){
        let page = Int.random(in: 1..<10)
        self.page = page
        
        let urlString: String = "https://loremflickr.com/320/240?random=\(page)"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }

}
