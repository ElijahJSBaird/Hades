//
//  PostDetail.swift
//  Hades
//
//  Created by Brett Stevenson on 12/9/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import SwiftUI

struct PostDetail: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.headline)
            Text(post.subredditNamePrefixed)
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
    }
}

struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        PostDetail(post: Post(id: "", title: "Title", author: "author", url: "https://google.com", subredditNamePrefixed: "r/iOSProgramming"))
        .previewLayout(.sizeThatFits)
    }
}
