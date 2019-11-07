//
//  RedditOAuth.swift
//  Hades
//
//  Created by Brett Stevenson on 11/3/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import Foundation
import p2_OAuth2

/**
    Simple class handling authorization and data requests with Reddit.
 */
class RedditLoader: OAuth2DataLoader, DataLoader {
    
    let baseURL = URL(string: "https://oauth.reddit.com")!
    
    public init() {
        let oauth = OAuth2CodeGrant(settings: [
            "client_id": "TYISFe5UynBibw",                              // yes, this client-id will work!
            "client_secret": "",
            "authorize_uri": "https://www.reddit.com/api/v1/authorize",
            "token_uri": "https://www.reddit.com/api/v1/access_token",
            "scope": "identity",                                        // note that reddit uses comma-separated, not space-separated scopes!
            "redirect_uris": ["hades://oauth-callback"],           // app has registered this scheme
            "parameters": ["duration": "permanent"],
        ])
        oauth.authConfig.authorizeEmbedded = true
        oauth.logger = OAuth2DebugLogger(.trace)
        super.init(oauth2: oauth)
        alsoIntercept403 = true
    }
    
    /** Perform a request against the API and return decoded JSON or an Error. */
    func request(path: String, callback: @escaping ((OAuth2JSON?, Error?) -> Void)) {
        let url = baseURL.appendingPathComponent(path)
        let req = oauth2.request(forURL: url)
        
        perform(request: req) { response in
            do {
                let dict = try response.responseJSON()
                if response.response.statusCode < 400 {
                    DispatchQueue.main.async() {
                        callback(dict, nil)
                    }
                }
                else {
                    DispatchQueue.main.async() {
                        callback(nil, OAuth2Error.generic("\(response.response.statusCode)"))
                    }
                }
            }
            catch let error {
                DispatchQueue.main.async() {
                    callback(nil, error)
                }
            }
        }
    }
    
    func requestUserdata(callback: @escaping ((_ dict: OAuth2JSON?, _ error: Error?) -> Void)) {
        request(path: "api/v1/me", callback: callback)
    }
}

/**
Protocol for loader classes.
*/
public protocol DataLoader {
    
    var oauth2: OAuth2 { get }
    
    /** Call that is supposed to return user data. */
    func requestUserdata(callback: @escaping ((_ dict: OAuth2JSON?, _ error: Error?) -> Void))
}
