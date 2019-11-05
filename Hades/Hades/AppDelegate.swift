//
//  AppDelegate.swift
//  Hades
//
//  Created by Elijah Baird on 10/28/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import UIKit
//import p2_OAuth2
import reddift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var session: Session?
    var window: UIWindow?
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        // handle redirect URL from reddit.com
        return OAuth2Authorizer.sharedInstance.receiveRedirect(url as URL, completion: {(result) -> Void in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let token):
                DispatchQueue.main.async(execute: { () -> Void in
                    do {
                        try OAuth2TokenRepository.save(token: token, of: token.name)
                    } catch { print(error) }
                })
            }
        })
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        // handle redirect URL from reddit.com
        return OAuth2Authorizer.sharedInstance.receiveRedirect(url as URL, completion: {(result) -> Void in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let token):
                DispatchQueue.main.async(execute: { () -> Void in
                    do {
                        try OAuth2TokenRepository.save(token: token, of: token.name)
                    } catch { print(error) }
                })
            }
        })
    }
    
    func refreshSession() {
        // refresh current session token
        do {
            try self.session?.refreshToken({ (result) -> Void in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let token):
                    DispatchQueue.main.async(execute: { () -> Void in
                        print(token)
                    })
                }
            })
        } catch { print(error) }
    }

    func reloadSession() {
        // reddit username is save NSUserDefaults using "currentName" key.
        // create an authenticated or anonymous session object
        if let currentName = UserDefaults.standard.object(forKey: "currentName") as? String {
            do {
                let token = try OAuth2TokenRepository.token(of: currentName)
                self.session = Session(token: token)
                self.refreshSession()
            } catch { print(error) }
        } else {
            self.session = Session()
        }
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        self.reloadSession()
        DispatchQueue.global(qos: .default).async {
            let html = ""
            do {
                if let data = html.data(using: .unicode) {
                    let attr = try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                    print(attr)
                }
            } catch {
            }
        }
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        self.refreshSession()
    }
}

extension UIApplication {
    static func appDelegate() -> AppDelegate? {
        if let obj = self.shared.delegate as? AppDelegate {
            return obj
        }
        return nil
    }
}


//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//    let oauth2 = OAuth2CodeGrant(settings: [
//        "client_id": "TYISFe5UynBibw",
//        "client_secret": "",
//        "authorize_uri": "https://www.reddit.com/api/v1/authorize",
//        "token_uri": "https://www.reddit.com/api/v1/access_token",
//        "redirect_uris": ["hades://oauth-callback"],  // app has registered this scheme
//        "parameters": ["duration": "permanent"],
//    ] as OAuth2JSON)
//
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        if (url.scheme == "hades" && url.host == "oauth-callback") {
//            oauth2.handleRedirectURL(url)
//        }
//        return true
//    }
//
//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
//        return OAuth2Authorizer.sharedInstance.receiveRedirect(url as URL, completion:{(result) -> Void in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let token):
//                dispatch_async(DispatchQueue.main, { () -> Void in
//                    OAuth2TokenRepository.sharedInstance.saveIntoKeychainToken(token, name:token.name)
//                })
//            }
//        })
//    }
//}

