//
//  DetailViewController.swift
//  Youtube
//
//  Created by Tulsi Vanol on 10/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var descriptionView: UITextView!
    
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        descriptionView.text = ""
        
        guard video != nil else {
            return
        }
        
        let embedUrl = Constants.YT_EMBED_URL + video!.videoId
        
        let url = URL(string: embedUrl)
        
        let request = URLRequest(url: url!)
        
        webView.load(request)
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        descriptionView.text = video!.description
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
