//
//  AccessTokenVerifier.swift
//  Roam
//
//  Created by olddonkey on 2018/3/21.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Cocoa

class AccessTokenVerifier: NSObject {
    // 1. Token is not in Keychain
    // 2. Token is in Keycain, but it is invalid
    // 3. Token is valid
    var userToken: UserToken
    
    init(userToken: UserToken) {
        self.userToken = userToken
    }
    
    func isTokenValid() -> Bool {
        
        return true
    }
    
}
