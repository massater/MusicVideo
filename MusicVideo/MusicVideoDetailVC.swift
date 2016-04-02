//
//  MusicVideoDetailVC.swift
//  MusicVideo
//
//  Created by ravizza on 3/30/16.
//  Copyright © 2016 reliability. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class MusicVideoDetailVC: UIViewController {

    var videos : Videos!
    
    var security:Bool = false
    
    @IBOutlet weak var vName: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var vGenre: UILabel!
    @IBOutlet weak var vPrice: UILabel!
    @IBOutlet weak var vRights: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//         security = NSUserDefaults.standardUserDefaults().boolForKey("SecuritySetting")
        title = videos.vArtist
        
        vName.text = videos.vName
        vPrice.text = videos.vPrice
        vGenre.text = videos.vGenre
        vRights.text = videos.vRights
        
        if (videos.vImageData != nil) {
            videoImage.image = UIImage(data: videos.vImageData!)
        }
        else{
            videoImage.image = UIImage(named: "imageNotAvailable")
        }
    }

  
    @IBAction func playVideo(sender: AnyObject) {
        let url = NSURL(string: videos.vVideoURL)!
        
        let player = AVPlayer(URL: url)
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.presentViewController(playerViewController, animated: true) { 
            playerViewController.player?.play()
        }
        
        
    }
   
}
