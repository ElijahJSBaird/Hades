//
//  FeedPosts.swift
//  Hades
//
//  Created by Elijah Baird on 11/20/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import SwiftUI
import reddift

struct FeedPosts: View {
    @ObservedObject var listingViewModel: ListingViewModel
//    @State var token: Token

    @State private var query = ""
    @State private var subredditTitle = "r/all"
    
    var body: some View {
        VStack{
            NavigationLink(destination: PostUIView()){
                Text("Post")
            }
            List {
                TextField("Search Subreddit", text: self.$query) {
                    self.subredditTitle = "r/\(self.query.lowercased())"
                    self.fetchListing()
                }
                ForEach(listingViewModel.posts) { post in
                    NavigationLink(destination: WebView(request: URLRequest(url: URL(string: post.url)!))) {
                        PostRow(post: post)
                    }
                }
            }
        }
        .navigationBarTitle(Text(subredditTitle))
        .onAppear(perform: fetchListing)
        .navigationBarBackButtonHidden(true)
    }
    
    private func fetchListing() {
        listingViewModel.fetchListing(for: query)
    }
}

//#if DEBUG
//struct FeedPosts_Previews : PreviewProvider {
//    static var previews: some View {
//        FeedPosts(listingViewModel: ListingViewModel(service: RedditService()), token: self.token)
//    }
//}
//#endif
