//
//  APIManager.swift
//  MusicVideo
//
//  Created by ravizza on 3/27/16.
//  Copyright © 2016 reliability. All rights reserved.
//

import Foundation

class APIManager {
    func loadData(urlString:String, completion:([Videos]) -> Void) {
        
        // Turn off cache
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        //let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        // Async call to URL
        let task = session.dataTaskWithURL(url){
            (data, response, error) -> Void in
            
                if error != nil {
                    print(error!.localizedDescription)

                }else {
                    //Added  for JSONSerializtion
                    //print(data)
                    
                    do{
                        // Converts the NSData into a JSOn Object and cast is to a Dcitionary
                        if let json = try NSJSONSerialization.JSONObjectWithData(data!,
                            options: .AllowFragments) as? JSONDictionary,
                            feed = json["feed"] as? JSONDictionary,
                            entries = feed["entry"] as? JSONArray
                        {
                            
                            var videos = [Videos]()
                            for entry in entries {
                                let entry = Videos(data: entry as! JSONDictionary)
                                videos.append(entry)
                            }
                            
                            let i = videos.count
                            print("iTunesApiManager - total count --> \(i)")
                            print(" ")
                            
                            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0), {
                                dispatch_async(dispatch_get_main_queue(), {
                                    completion(videos)
                                })
                            })
                        }
                    
                    }catch{
                        print("Error inJSONSerialization")
                    }
                }
            
        }
        
        task.resume()
    }
}