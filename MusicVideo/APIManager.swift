//
//  APIManager.swift
//  MusicVideo
//
//  Created by ravizza on 3/27/16.
//  Copyright © 2016 reliability. All rights reserved.
//

import Foundation

class APIManager {
    func loadData(urlString:String, completion:(result:String) -> Void) {
        
        // Turn off cache
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        //let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        // Async call to URL
        let task = session.dataTaskWithURL(url){
            (data, response, error) -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { 
                if error != nil {
                    completion(result: (error!.localizedDescription))
                }else {
                    completion(result: "NSURLSession succesful")
                    print(data)
                }
            })
        }
        
        task.resume()
    }
}