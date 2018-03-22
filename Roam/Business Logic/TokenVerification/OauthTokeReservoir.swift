//
//  OauthTokeReservoir.swift
//  Roam
//
//  Created by olddonkey on 2018/3/17.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Cocoa
import KeychainSwift

class UserToken: NSObject, NSCoding {
    
    let accessToken: String
    let scope: String
    let tokenType: String
    
    init(accessToken: String, scope: String, tokenType: String) {
        self.accessToken = accessToken
        self.scope = scope
        self.tokenType = tokenType
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.accessToken = aDecoder.decodeObject(forKey: "accessTokenKey") as? String ?? ""
        self.scope = aDecoder.decodeObject(forKey: "scopekey") as? String ?? ""
        self.tokenType = aDecoder.decodeObject(forKey: "tokenTypeKey") as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(accessToken, forKey: "accessTokenKey")
        aCoder.encode(scope, forKey: "scopekey")
        aCoder.encode(tokenType, forKey: "tokenTypeKey")
    }

}

class OauthTokeReservoir: NSObject {
    
    enum storeUserTokenError: Error {
        case KeychainFailed
    }
    
    enum retrieveUserTokenError: Error {
        case invalidKeychainData
        case invalidKeychainDataModel
    }
    
    let userTokenKeychainStorageKey = "userTokenKeychainStorageKey"
    var keychain: KeychainSwift
    
    init(keyPrefix: String = "Roam_") {
        keychain = KeychainSwift(keyPrefix: keyPrefix)
    }
    
    func storeUserToken(_ userToken: UserToken) throws {
        let keychain = KeychainSwift()
        let encodedUserToken = NSKeyedArchiver.archivedData(withRootObject: userToken)
        if !keychain.set(encodedUserToken, forKey: userTokenKeychainStorageKey) {
            throw storeUserTokenError.KeychainFailed
        }
    }
    
    @discardableResult
    func retrieveUserToken() throws -> UserToken {
        let keychain = KeychainSwift()
        guard let encodedUserToken = keychain.getData(userTokenKeychainStorageKey) else {
            throw retrieveUserTokenError.invalidKeychainData
        }
        guard let userToken = NSKeyedUnarchiver.unarchiveObject(with: encodedUserToken) as? UserToken else {
            throw retrieveUserTokenError.invalidKeychainDataModel
        }
        return userToken
    }
}
