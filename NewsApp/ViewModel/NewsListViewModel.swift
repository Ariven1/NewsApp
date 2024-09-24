//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Ariven on 12/09/24.
//

import Foundation

protocol NewsListViewModelDelegate {
    func news(response: NewsResponse?)
}

struct NewsListViewModel {
    var delegate: NewsListViewModelDelegate?
    
    func getNews(category: String) {
        let newsResource = NewsResource()
        newsResource.getNews(category: category) { newsResponse in
            DispatchQueue.main.async {
                self.delegate?.news(response: newsResponse)
            }
        }
    }
}
