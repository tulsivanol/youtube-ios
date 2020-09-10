//
//  VideoTableViewCell.swift
//  Youtube
//
//  Created by Tulsi Vanol on 10/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleTextView: UILabel!
    
    @IBOutlet weak var dateTextView: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func setCell(_ v:Video){
        
        self.video = v
        
        guard self.video != nil else{
            return
        }
        
        self.titleTextView.text = video?.title
        
        //        format the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        
        self.dateTextView.text = df.string(from:video!.published)
        
        guard self.video!.thumbnail != "" else{return}
        
        if let cacheData =  CacheManager.getVideoCache(self.video!.thumbnail)  {
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        let dataTask  = session.dataTask(with: url!){(data,response,error) in
            
            if error != nil || data == nil{
                return
            }
            if url?.absoluteString != self.video?.thumbnail {
                return
            }
            
            let image = UIImage(data: data!)
            
            CacheManager.setVideoCache(url!.absoluteString, data)
            
            DispatchQueue.main.async {
                self.thumbnailImageView?.image = image
            }
            
        }
        
        dataTask.resume()
        
        
    }
    
}
