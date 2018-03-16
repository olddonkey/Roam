//
//  AuthenticationParameters.swift
//  Roam
//
//  Created by olddonkey on 2018/3/15.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Cocoa

class AuthenticationParameters: NSObject {
    static let client_id_Key: String = "client_id"
    static let client_secret_Key: String = "client_secret"
    static let redirect_url_Key: String = "redirect_uri"
    static let scope_Key: String = "scope"
    static let state_Key: String = "state"
    static let allow_signup_Key: String = "allow_signup"
    
    static let code_Key: String = "code"
    
    static let client_id_Value: String = "a35cc61e1c4d9c483449"
    static let client_secret_Value: String = "3e5b4b326b9bb7df3d5a1841e781a533d2613d7d"
    static let state_Value = RandomString.sharedInstance.getRandomStringOfLength(length: 10)
    static let scope_Value: String = "repo gist user delete_repo"
}

fileprivate class RandomString {
    let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    func getRandomStringOfLength(length: Int) -> String {
        var ranStr = ""
        for _ in 0..<length {
            let index = Int(arc4random_uniform(UInt32(characters.count)))
            ranStr.append(characters[characters.index(characters.startIndex, offsetBy: index)])
        }
        return ranStr
    }

    static let sharedInstance = RandomString()
}
