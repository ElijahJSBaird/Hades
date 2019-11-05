//
//  ContentView.swift
//  Hades
//
//  Created by Elijah Baird on 10/28/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                RedditLogo()
                NavigationLink(destination: AccountView()) {
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

struct AccountView: View {
    var body: some View {
        // Need to convert AccountController.swift from UITableViewController
        // to SwiftUI
        AccountController()
    }
}
