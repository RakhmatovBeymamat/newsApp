//
//  NewsMods.swift
//
//  Created by Beymamat Rakhmatov on 21/09/24.
//

import Foundation

struct NewsModel: Codable {
    var articles: [NewsItem]?
}

struct NewsItem: Codable {
    var author: String?
    var title: String?
    var description: String?
    var content: String?
    var urlToImage: String?
    var publishedAt: String?
}
