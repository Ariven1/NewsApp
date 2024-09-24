//
//  NewsResponseModel.swift
//  NewsApp
//
//  Created by Ariven on 12/09/24.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String?
    var articles: [Article]?
}

struct Article: Decodable {
    let source: Source?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

struct Source: Decodable {
    let name: String?
}
