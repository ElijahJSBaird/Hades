//
//  Feed.swift
//  Hades
//
//  Created by Elijah Baird on 11/20/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//
// A list of posts

import SwiftUI
import Foundation

struct Feed {
    var posts = [Post]()
}

// MARK: - Decodable
extension Feed: Decodable {
    enum CodingKeys: String, CodingKey {
        case posts = "children"
        
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        posts = try data.decode([Post].self, forKey: .posts)
    }
}
