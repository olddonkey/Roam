//
//  AuthenticationManager.swift
//  Roam
//
//  Created by olddonkey on 2018/3/15.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Cocoa
import Alamofire

class AuthenticationManager: NSObject {
    
    func requestNewAuthenticationIdentity() {
        // Potential to do in the future: have a native webview VC to open the url, instead of use system browser for consistency
        let parameters: [String: String] = [AuthenticationParameters.client_id_Key:AuthenticationParameters.client_id_Value,
                                      AuthenticationParameters.scope_Key:AuthenticationParameters.scope_Value,
                                      AuthenticationParameters.state_Key:AuthenticationParameters.state_Value]
        guard var url = URL(string: "https://github.com/login/oauth/authorize") else {
            // Todo: Add error handling here.
            return
        }
        url = url.appendingQueryParameters(parameters)
        NSWorkspace.shared.open(url)
    }
    
    func didReceiveCodeAndState(code: String, state: String) {
        
    }
    
    
    func requestAccessToken(code: String) {
        let parameters: Parameters = [AuthenticationParameters.client_id_Key:AuthenticationParameters.client_id_Value,
                                      AuthenticationParameters.client_secret_Key:AuthenticationParameters.client_secret_Value,
                                      AuthenticationParameters.code_Key:code,
                                      AuthenticationParameters.state_Key:AuthenticationParameters.state_Value]
        Alamofire.request("https://github.com/login/oauth/access_token", method: .post, parameters: parameters).validate().responseJSON { response in
            if let json = response.result.value {
                print("\(json)")
            }
        }
    }
}
