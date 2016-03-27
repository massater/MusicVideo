//
//  ViewController.swift
//  MusicVideo
//
//  Created by ravizza on 3/27/16.
//  Copyright © 2016 reliability. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion:didLoadData)
    }

    func didLoadData(result:String){
        
        print(result)
        
        let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { (Void) in
            print("OK")
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}

