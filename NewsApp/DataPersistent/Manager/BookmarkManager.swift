//
//  BookmarkManager.swift
//  NewsApp
//
//  Created by Ariven on 15/09/24.
//

import CoreData

struct BookmarkManager {
    private let bookmarkDataRepository = BookmarkDataRepository()
    
    func add(bookmarkId: String) {
        bookmarkDataRepository.create(bookmarkId: bookmarkId)
    }
    
    func isBookmarked(bookmarkId: String) -> Bool {
        return bookmarkDataRepository.isBookmarked(bookmarkId: bookmarkId)
    }
    
    func delete(bookmarkId: String) -> Bool {
        return bookmarkDataRepository.delete(bookmarkId: bookmarkId)
    }
}
