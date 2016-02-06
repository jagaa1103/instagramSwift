//
//  InstagramLoginService.swift
//  instagramSwift
//
//  Created by Enkhjargal Gansukh on 2/5/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import OAuthSwift

class InstagramLoginService: NSObject {
    
    
    
    
    func login(){
        let oauthswift = OAuth2Swift(
            consumerKey:    "d1a32674278749fba0a15a82dec0966e",
            consumerSecret: "2eed54f2dda14a23b5e713f860b92926",
            authorizeUrl:   "https://api.instagram.com/oauth/authorize",
            responseType:   "token"
        )
        
        let state: String = generateStateWithLength(20) as String
        oauthswift.authorize_url_handler = get_url_handler()
        oauthswift.authorizeWithCallbackURL( NSURL(string: "instagramSwift://oauth-callback/instagram")!, scope: "likes+comments", state:state, success: {
            credential, response, parameters in
            self.showTokenAlert(credential)
            self.testInstagram(oauthswift)
            }, failure: { error in
                print(error.localizedDescription)
        })
    }
    
    func testInstagram(oauthswift: OAuth2Swift) {
        let url :String = "https://api.instagram.com/v1/users/1574083/?access_token=\(oauthswift.client.credential.oauth_token)"
        let parameters :Dictionary = Dictionary<String, AnyObject>()
        oauthswift.client.get(url, parameters: parameters,
            success: {
                data, response in
                let jsonDict: AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
                print(jsonDict)
                
            }, failure: { error in
                print(error)
        })
    }
    
    func showTokenAlert(credential: OAuthSwiftCredential) {
        print(credential)
    }
    
    func logout(){
    }
    
    func get_url_handler() -> OAuthSwiftURLHandlerType {
        // Create a WebViewController with default behaviour from OAuthWebViewController
        let url_handler = createWebViewController()
      
        return url_handler
    }
    
    func createWebViewController() -> WebViewController {
        let controller = WebViewController()
        return controller
    }
}
