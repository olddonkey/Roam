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
    let authenticationManager: AuthenticationManagerProtocol
    
    init(authenticationManager: AuthenticationManagerProtocol) {
        self.authenticationManager = authenticationManager
    }
    
    func handleURL(url: URL) {
        // oauth 2.0 case
        if url.host == "authentication" {
            guard let query = url.queryParameters, let code = query["code"], let state = query["state"] else {
                return
            }
            authenticationManager.receiveCodeAndState(code: code, state: state)
        }
    }
}
