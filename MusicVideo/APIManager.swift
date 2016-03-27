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
            
                if error != nil {
                    dispatch_async(dispatch_get_main_queue(), {
                        completion(result: (error!.localizedDescription))
                    })
                }else {
                    completion(result: "NSURLSession succesful")
                    //Added  for JSONSerializtion
                    //print(data)
                    
                    do{
                        if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary {
                            print(json)
                            
                            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0), { 
                                dispatch_async(dispatch_get_main_queue(), { 
                                    completion(result: "JSONSerialization Successful")
                                })
                            })
                        }
                    
                    }catch{
                        dispatch_async(dispatch_get_main_queue(), {
                            completion(result: "Error inJSONSerialization")
                        })
                    }
                }
            
        }
        
        task.resume()
    }
}