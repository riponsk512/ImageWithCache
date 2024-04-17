//
//  Constant.swift
//  ImageWithCache
//
//  Created by Ripon sk on 15/04/24.
//

import Foundation

let StrUrl = "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=100"
var SharedUrl = URLSession.shared
func getURL(domain:String?,basePath:String?)->URL?{
    guard let domain = domain else{
        print("Empty URL")
        return nil
    }
    guard let basePath = basePath else{
        print("Empty URL")
        return nil
    }
   
    let url = URL(string:domain+"/"+basePath+"/"+"\(0)/"+"image.jpg")
    return url
}

