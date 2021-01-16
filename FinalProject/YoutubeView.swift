//
//  youtubeView.swift
//  FinalProject
//
//  Created by User11 on 2021/1/6.
//UC7OWR92rzpvqzJGz0wYzhOg
//https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id=UC7OWR92rzpvqzJGz0wYzhOg&key=AIzaSyBncoirMPCSluuGBlZatqG8XszIA-nCBKA
//https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=UU7OWR92rzpvqzJGz0wYzhOg&key=AIzaSyBncoirMPCSluuGBlZatqG8XszIA-nCBKA&maxResults=20
//https://jsoneditoronline.org/#right=local.muxuho&left=local.cimaho
// https://www.youtube.com/watch?v=XCBkv6myAJY

import SwiftUI

struct YoutubeView: View {
    
    @State private var youtubes = [Items]()
    
    func fetchSongs() {
        let urlStr = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=UU7OWR92rzpvqzJGz0wYzhOg&key=AIzaSyBncoirMPCSluuGBlZatqG8XszIA-nCBKA&maxResults=30"
        
        if let url = URL(string: urlStr) {
            
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data{
                    do{
                        let songResults = try decoder.decode(Youtube.self, from: data)
                        youtubes = songResults.items
                        print(youtubes)
                        } catch {
                        print(error)
                    }
                }
            }.resume()
        }
        
    }
    @State private var showWebpage = false

    var body: some View {
        VStack{
            Image("1")
                .border(Color.black, width: 8)
                .border(Color.white, width: 4)
            Text("~ 大佬甜的youtube ~")
                .font(.body)
                .fontWeight(.black)
                .foregroundColor(Color.white)
            
            List(youtubes.indices, id:\.self, rowContent: { (index) in
                if youtubes.count > 0 {
                    VStack{
                        HStack{
                            YoutubeImage(url: youtubes[index].snippet.thumbnails.medium.url)
                            /*Link(youtubes[index].snippet.title, destination: URL(string: "https://www.youtube.com/watch?v=\(youtubes[index].contentDetails.videoId)")!)*/
                            Button(youtubes[index].snippet.title) {
                                        showWebpage = true
                                    }
                                    .sheet(isPresented: $showWebpage) {
                                        SafariView(url: URL(string: "https://www.youtube.com/watch?v=\(youtubes[index].contentDetails.videoId)")!)
                                    }
                
                        }
                
                    }
                    
                }
                
            })
            .onAppear(perform: {
                            fetchSongs()
                        })
            
        }
        .padding().background(Color(red: 0.9, green: 0.4, blue: 0.4)).cornerRadius(20)
        
    }
}

struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView()
    }
}
