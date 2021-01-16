//
//  SafariView.swift
//  FinalProject
//
//  Created by 陳濰暄 on 2021/1/8.
//

import Foundation
import SwiftUI
import SafariServices
struct SafariView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SFSafariViewController {
         SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = SFSafariViewController
    
    let url: URL
}
struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://www.managertoday.com.tw/eightylife/article/view/618")!)
    }
}
