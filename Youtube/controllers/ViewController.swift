//
//  ViewController.swift
//  Youtube
//
//  Created by Tulsi Vanol on 09/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate,VideoModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = VideoModel()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        set itself as datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        model.getVideos()
    }
    
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.video = selectedVideo
    }
    
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_CELL_ID, for: indexPath) as! VideoTableViewCell
        
        let video = self.videos[indexPath.row]
        
        
        cell.setCell(video)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}

