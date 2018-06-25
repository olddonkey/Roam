//
//  AccessTokenVerificationManager.swift
//  Roam
//
//  Created by olddonkey on 2018/4/5.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation
import Result

protocol AccessTokenVerificationManagerProtocol {
    
}

class AccessTokenVerificationManager: AccessTokenVerificationManagerProtocol, ProcedureProtocol {
        
    var tokenReservoir: OauthTokenReservoir
    
    enum AccessTokenVerificationError: Error {
        case noAvailableToken
        case tokenExpired(String)
    }
    
    var delegate = Delegate<Result<String, AccessTokenVerificationError>, Void>()
    
    init(tokenReservoir: OauthTokenReservoir) {
        self.tokenReservoir = tokenReservoir
    }
    
    func start() {
        
    }
    
    func tryToFetchTokenFromUserDefault() {
        switch tokenReservoir.retrieveUserToken() {
        case let .success(userToken):
            printLog(message: "Successfully retrived user token from UserDefault: \(userToken.accessToken)")
            verifyUserToken(userToken: userToken)
        case .failure(.invalidKeychainData):
            printLog(message: "Tried to retrive user token from UserDefault, but invalid data")
        case .failure(.invalidKeychainDataModel):
            printLog(message: "Tried to retrive user token from UserDefault, data tranform to userToken is not valid")
        }
    }
    
    func verifyUserToken(userToken: UserToken) {
        let verifier = AccessTokenVerifier(userToken: userToken)
        if verifier.isTokenValid() {
            //Verification Passed
        }else {
            
        }
    }
    
    func finish(result: Result<Void, AccessTokenVerificationError>) {
        delegate.execute(Result.success("123"))
    }
}
