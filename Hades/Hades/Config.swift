//
//  Config.swift
//  Hades
//
//  Created by Brett Stevenson on 11/4/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import Foundation

/**
Class to manage parameters of reddift.
This class is used as singleton model
*/
struct Config {
    /// Developer's reddit user name
    let developerName: String
    /// OAuth redirect URL you register
    let redirectURI: String
    /// Application ID
    let clientID: String
    
    /**
    Singleton model.
    */
    static let sharedInstance = Config()
    
    /**
    Returns User-Agent for API
    */
    var userAgent: String {
        return "(by /u/" + developerName + ")"
    }
    
    /**
    Returns scheme of redirect URI.
    */
    var redirectURIScheme: String {
        if let scheme = URL(string: redirectURI)?.scheme {
            return scheme
        } else {
            return ""
        }
    }
    
    init() {
        var _developerName: String? = nil
        var _redirectURI: String? = nil
        var _clientID: String? = nil
        if let path = Bundle.main.path(forResource: "config", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] {
                        _developerName = json["DeveloperName"] as? String
                        _redirectURI = json["redirect_uri"] as? String
                        _clientID = json["client_id"] as? String
                    }
                } catch {
                    
                }
            }
        }
        
        developerName = _developerName ?? ""
        redirectURI = _redirectURI ?? ""
        clientID = _clientID ?? ""
    }
}
