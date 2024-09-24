//
//  Common.swift
//  NewsApp
//
//  Created by Ariven on 12/09/24.
//

import Foundation

enum Categories: String, CaseIterable {
    case business, entertainment, general, health, science, sports, technology
}

struct ApiKey {
    static let key = "89ed323d040741a2813577931d46eec8"
}

struct ApiEndpoint {
    static func newApi(category: String) -> String {
        return "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=\(ApiKey.key)"
    }
}

struct ImageName {
    static let bookmark = "bookmark"
    static let bookmarkFill = "bookmark.fill"
    static let placeholderImage = "placeholderImage"
}

struct SegueName {
    static let newsDetail = "newsDetail"
}

struct StringConstant {
    static let error = "Error"
    static let alert = "Alert"
    static let somethingWentWrong = "Something went wrong"
    static let noDataFound = "No Data Found"
    static let category = "Category"
    static let ok = "OK"
}

struct TableViewCellIdentifier {
    static let newsCell = "newsCell"
}

struct TableViewCellName {
    static let newsTableViewCell = "NewsTableViewCell"
}

struct EntityName {
    static let cdBookmark = "CDBookmark"
}
