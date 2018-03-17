//
//  OauthTokeReservoir.swift
//  Roam
//
//  Created by olddonkey on 2018/3/17.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Cocoa

struct UserToken {
    let accessToken: String
    let scope: String
    let tokenType: String
    
    init(accessToken: String, scope: String, tokenType: String) {
        self.accessToken = accessToken
        self.scope = scope
        self.tokenType = tokenType
    }
}

class OauthTokeReservoir: NSObject {

}
