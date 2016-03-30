//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by ravizza on 3/27/16.
//  Copyright © 2016 reliability. All rights reserved.
//

import Foundation

class Videos {
    
    var vRank = 0
    
    // Data Encapsulation
    private var _vName:String
    private var _vRights:String
    private var _vPrice:String
    private var _vImageURL:String
    private var _vArtist:String
    private var _vVideoURL:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinksToiTunes:String
    private var _vReleaseDate:String
    
    // This var gets created fron the UI
    var vImageData:NSData?
    
    // Make Getters
    var vName: String{
        return _vName
    }
    
    var vRights: String{
        return _vRights
    }

    var vPrice: String{
        return _vPrice
    }

    var vImageURL: String{
        return _vImageURL
    }
    
    var vArtist: String{
        return _vArtist
    }

    var vVideoURL: String{
        return _vVideoURL
    }
    
    var vImid: String{
        return _vImid
    }
    
    var vGenre: String{
        return _vGenre
    }
    
    var vLinksToiTunes: String{
        return _vLinksToiTunes
    }
    
    var vReleaseDate: String{
        return _vReleaseDate
    }
    
    init(data: JSONDictionary){
        // The Video Name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
            self._vName = vName
        }
        else{
            _vName = ""
        }
        
        // The Studio Name
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String {
            self._vRights = vRights
        }
        else{
            _vRights = ""
        }

        // The Video Price
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String {
            self._vPrice = vPrice
        }
        else{
            _vPrice = ""
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
        
        // The Artist Name
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String {
            self._vArtist = vArtist
        }
        else{
            _vArtist = ""
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

        // The Artist ID for iTunes Search API
        if let imid = data["id"] as? JSONDictionary,
            vid = imid["attributes"] as? JSONDictionary,
            vImid = vid["im:id"] as? String {
            self._vImid = vImid
        }
        else{
            _vImid = ""
        }

        // The Genre
        if let genre = data["category"] as? JSONDictionary,
            rel2 = genre["attributes"] as? JSONDictionary,
            vGenre = rel2["term"] as? String {
            self._vGenre = vGenre
        }
        else{
            _vGenre = ""
        }

        // The Video LInk to iTunes
        if let release = data["is"] as? JSONDictionary,
            vLinksToiTunes = release["term"] as? String {
            self._vLinksToiTunes = vLinksToiTunes
        }
        else{
            _vLinksToiTunes = ""
        }

        // The Relase Date
        if let release = data["im:releaseDate"] as? JSONDictionary,
            relAttr = release["attributes"] as? JSONDictionary,
            vReleaseDate = relAttr["label"] as? String {
            self._vReleaseDate = vReleaseDate
        }
        else{
            _vReleaseDate = ""
        }

    }
}









