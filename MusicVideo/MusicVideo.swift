//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by ravizza on 3/27/16.
//  Copyright © 2016 reliability. All rights reserved.
//

import Foundation

class Videos {
    
    // Data Encapsulation
    private var _vName:String
    private var _vImageURL:String
    private var _vVideoURL:String
    
    
    // Make Getters
    var vName: String{
        return _vName
    }
    
    var vImageURL: String{
        return _vImageURL
    }
    
    var vVideoURL: String{
        return _vVideoURL
    }
    
    init(data: JSONDictionary){
        // The Video Name
        if let name = data["in:name"] as? JSONDictionary,
            vName = name["label"] as? String {
            self._vName = vName
        }
        else{
            _vName = ""
        }
        
        // The Video Image
        if let img = data["im:image"] as? JSONArray,
            image = img.last as? JSONDictionary,
            imImage = image["label"] as? String {
                _vImageURL = imImage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else{
             _vImageURL = ""
        }
        
        // The Video URL
        if let video = data["link"] as? JSONArray,
            vURL = video[1] as? JSONDictionary,
            vHref = vURL["attributes"] as? JSONDictionary,
            vVideoURL = vHref["href"] as? String {
                self._vVideoURL = vVideoURL
        }
        else{
            _vVideoURL = ""
        }

    }
}