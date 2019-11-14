//
//  ContentView.swift
//  Hades
//
//  Created by Elijah Baird on 10/28/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import SwiftUI
import reddift
import UIKit

struct ContentView: View {
    let sharedInstance = Config.sharedInstance
    var body: some View {
        NavigationView {
            VStack {
                RedditLogo()
                Button(action: {
                    do {
                        try OAuth2Authorizer.sharedInstance.challengeWithAllScopes()
                    } catch { }
                }) {
                    LoginButton()
                }
            }
            .padding()
        }
    }
}

struct RedditLogo : View {
    var body: some View {
        return Image("reddit")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 185, height: 185)
            .padding(.bottom, 200)
    }
}

struct LoginButton : View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct AccountView: UIViewControllerRepresentable {
//
//    var controllers: [UITableViewController]
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<AccountView>) -> UITableViewController {
//        let accountViewController = AccountController()
//        return accountViewController
//    }
//
//    func updateUIViewController(_ accountViewController: UITableViewController, context: UIViewControllerRepresentableContext<AccountView>) {
////        accountViewController.setViewControllers([controllers[0]], direction: .forward, animated: true)
//    }
//
//    typealias UIViewControllerType = UITableViewController
//}
