//
//  CacheManager.swift
//  Youtube
//
//  Created by Tulsi Vanol on 10/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import Foundation


class CacheManager{
    
    static var cacheDict = [String:Data]()
    
    static func setVideoCache(_ url:String,_ data:Data?){
        cacheDict[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data?{
        return cacheDict[url]
    }
}
