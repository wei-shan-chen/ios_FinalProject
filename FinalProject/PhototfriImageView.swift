//
//  PhototfriImageView.swift
//  FinalProject
//
//  Created by User11 on 2021/1/6.
//

import SwiftUI

struct PhototfriImageView: View {
    var url: URL
    @State private var uiImage = UIImage(systemName: "photo")!
    
    func downLoad() {
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let uiImage = UIImage(data: data) {
                    self.uiImage = uiImage
                    
                }
            }.resume()

        
    }
    var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            //.frame(width: 150, height: 150)
            //.border(Color.black, width: 2)
            .onAppear {
                self.downLoad()
        }

    }
}

//struct PhototfriImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhototfriImageView(url:)
//    }
//}
