//
//  NewsResource.swift
//  NewsApp
//
//  Created by Ariven on 12/09/24.
//

import Foundation

struct NewsResource {
    func getNews(category: String, completion: @escaping (_ result: NewsResponse?) -> Void) {
        let httpUtility = HttpUtility()
        if let newsUrl = URL(string: ApiEndpoint.newApi(category: category)) {
            httpUtility.getApiData(requestUrl: newsUrl, resultType: NewsResponse.self) { newsResponse in
                // filtering out object with invalid image
                let validArticles = newsResponse?.articles?.filter { $0.urlToImage != nil }
                var validResponse = newsResponse
                validResponse?.articles = validArticles
                _ = completion(validResponse)
            }
        }
    }
}
