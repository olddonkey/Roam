//
//  RoamEventURLHandler.swift
//  Roam
//
//  Created by olddonkey on 2018/3/16.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Cocoa

class RoamEventURLHandler: NSObject {
    let authenticationModelKey = "authentication"
    
    func handleURL(url: URL) {
        if url.host == "authentication" {
            let query = url.queryParameters
            
        }
    }
}
