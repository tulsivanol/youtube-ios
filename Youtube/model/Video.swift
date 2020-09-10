//
//  Video.swift
//  Youtube
//
//  Created by Tulsi Vanol on 09/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import Foundation

struct Video :Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String,CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description = "description"
        case thumbnail = "url"
        case videoId
    }
    
    init(from decoder:Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self
            , forKey: .thumbnails)
        
        let thumbnailHighContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self
            , forKey: .high)
        
        let resourceContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        //parsing the key-value pair
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        self.thumbnail = try thumbnailHighContainer.decode(String.self,forKey: .thumbnail)
        
        self.videoId = try resourceContainer.decode(String.self, forKey: .videoId)
        
    }
}
