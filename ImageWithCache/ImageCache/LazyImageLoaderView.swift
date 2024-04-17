//
//  LazyImageLoaderView.swift
//  ImageWithCache
//
//  Created by Ripon sk on 15/04/24.
//
import Foundation
import UIKit
//Async Image Load
class LazyImageLoaderView:UIImageView{
    // Mark:for not the download image again and again
    let imagecache = NSCache<AnyObject,UIImage>()
    func loadimage(from imageurl:URL){
        
        if let chacheimg = self.imagecache.object(forKey: imageurl as AnyObject){
            self.image = chacheimg
            return
        }
        
        
        
        DispatchQueue.global().async {
            [weak self] in
            if let imgdata = try? Data(contentsOf: imageurl){
                if let image = UIImage(data: imgdata){
                    DispatchQueue.main.async {
                        self?.imagecache.setObject(image, forKey: imageurl as AnyObject)
                        self?.image = image
                    }
                }
               
            }
            
            
            
            
        }
    }
    
}
