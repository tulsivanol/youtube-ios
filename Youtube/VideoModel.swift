//
//  VideoModel.swift
//  Youtube
//
//  Created by Tulsi Vanol on 09/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import Foundation


class VideoModel {
    
    func getVideos(){
        
        let url = URL(string: Constants.BASE_URL)
        
        guard url != nil else{
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data != nil {
                print("Response from youtube",response!)
                print("Data from youtube",data!)
                return
            }
            
        }
        
        dataTask.resume()
        
    }
    
}
