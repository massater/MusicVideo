//
//  ViewController.swift
//  MusicVideo
//
//  Created by ravizza on 3/27/16.
//  Copyright © 2016 reliability. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var videos = [Videos]()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.reachabilityStatusChanged), name: "ReachabilityStatusChanged", object: nil)
        
        reachabilityStatusChanged()
        
        // Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion:didLoadData)
    }

    
    func didLoadData(videos: [Videos]){
        
        print(reachabilityStatus)
        
        self.videos = videos
        
        for (index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
        
    }
    
    func reachabilityStatusChanged() {
        
        switch reachabilityStatus {
        case NOACCESS :
            view.backgroundColor = UIColor.redColor()
            displayLabel.text = "No Internet"
        case WIFI :
            view.backgroundColor = UIColor.greenColor()
            displayLabel.text = "Reachable with WiFi"
        case WWAN :
            view.backgroundColor = UIColor.yellowColor()
            displayLabel.text = "Reachable with Cellular"
        default: return
        }

    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachabilityStatusChanged", object: nil)
    }
}

