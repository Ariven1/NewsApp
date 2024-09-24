//
//  BookmarkDataRepositoryUnitTest.swift
//  NewsAppTests
//
//  Created by Ariven on 16/09/24.
//

import XCTest
@testable import NewsApp

final class BookmarkDataRepositoryUnitTest: XCTestCase {

    func testIsBookmarkedCheckFailureWhenPassedInvalidbookmarkId() {
        let bookmarkDataRepository = BookmarkDataRepository()
        let isBookmarked = bookmarkDataRepository.isBookmarked(bookmarkId: "InvalidBookmarkId")
        XCTAssertFalse(isBookmarked)
    }
    
    func testIsBookmarkDeleteFailureWhenPassedInvalidbookmarkId() {
        let bookmarkDataRepository = BookmarkDataRepository()
        let isBookmarkedDeletable = bookmarkDataRepository.delete(bookmarkId: "InvalidBookmarkIdToDelete")
        XCTAssertFalse(isBookmarkedDeletable)
    }
}
