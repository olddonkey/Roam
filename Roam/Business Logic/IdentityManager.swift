//
//  IdentityManager.swift
//  Roam
//
//  Created by olddonkey on 2018/3/21.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Cocoa

class IdentityManager: NSObject {
    
    func appDidLaunched() {
        if isAccessTokenValid() {
            // TODO
        }
    }
    
    func isAccessTokenValid() -> Bool {
        return true
    }
    
    
}
