//
//  LoginView.swift
//  Hades
//
//  Created by Brett Stevenson on 11/3/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import SwiftUI
import p2_OAuth2

struct LoginView: View {
    
    let oauth = OAuth2CodeGrant(settings: [
        "client_id": "TYISFe5UynBibw",                              // yes, this client-id will work!
        "client_secret": "",
        "authorize_uri": "https://www.reddit.com/api/v1/authorize",
        "token_uri": "https://www.reddit.com/api/v1/access_token",
        "scope": "identity",                                        // note that reddit uses comma-separated, not space-separated scopes!
        "redirect_uris": ["hades://oauth-callback"],           // app has registered this scheme
        "parameters": ["duration": "permanent"],
    ])
    
    var body: some View {
        VStack {
            RedditLogo2()
            Button(action: {
                RedditLoader()
            }) {
                LoginButton2()
            }
        }
        .padding()
    }
}

struct RedditLogo2 : View {
    var body: some View {
        return Image("reddit")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 185, height: 185)
            .padding(.bottom, 200)
    }
}

struct LoginButton2 : View {
    var body: some View {
        return Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.orange)
            .cornerRadius(5.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
