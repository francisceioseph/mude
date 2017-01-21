//
//  MPUrls.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 19/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import Foundation

class MPUrls {
    static func urlForIndexPath(_ indexPath: IndexPath) -> URL? {
        
        var url: URL?
        
        if let urlsArray = MPUrls.readMPUrlsPlist() {
            let urlSection = urlsArray[indexPath.section] as! NSArray
            let urlString = urlSection[indexPath.row] as! String
            
            url = URL(string: urlString)
            
        }
        
        return url
    }
    
    fileprivate static func readMPUrlsPlist() -> NSArray? {
        var array: NSArray?
        
        if let path = Bundle.main.path(forResource: "MPUrlAddresses", ofType: "plist") {
            array = NSArray(contentsOfFile: path)
        }
        
        return array
    }
}
