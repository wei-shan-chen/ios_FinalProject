//
//  youtubeData.swift
//  FinalProject
//
//  Created by User11 on 2021/1/6.
//

import Foundation

struct Youtube: Codable {
    let items:[Items]
    let nextPageToken:String
}

struct Items: Codable {
    let snippet:Snippet
    let contentDetails:ContentDetails
}

struct ContentDetails: Codable {
    let videoId:String
}

struct Snippet: Codable {
    let thumbnails:Thumbnails
    let title:String
}

struct Thumbnails: Codable {
    let medium:Medium
}

struct Medium: Codable {
    let url:URL
    let width:Int
    let height:Int
}

struct YoutubeData: Codable {
    let youtube: [Youtube]
}
