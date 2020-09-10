//
//  VideoModel.swift
//  Youtube
//
//  Created by Tulsi Vanol on 09/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import Foundation

protocol VideoModelDelegate {
    func videosFetched(_ videos:[Video])
}


class VideoModel {
    
    var delegate:VideoModelDelegate?
    
    func getVideos(){
        
        let url = URL(string: Constants.BASE_URL)
        
        guard url != nil else{
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                }
                
            }catch{
                print("Unexpected error: \(error).")
            }
            
            
        }
        
        dataTask.resume()
        
    }
    
}
