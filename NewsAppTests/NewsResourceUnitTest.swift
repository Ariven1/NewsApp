//
//  NewsResourceUnitTest.swift
//  NewsAppTests
//
//  Created by Ariven on 16/09/24.
//

import XCTest
@testable import NewsApp

final class NewsResourceUnitTest: XCTestCase {

    func testNewsAPISuccessForValidCategory() {
        let newsResource = NewsResource()
        let expectation = self.expectation(description: "NewsAPISuccessForValidCategory")
        
        newsResource.getNews(category: "business") { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.status, "ok")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    func testNewsAPIWhenInvalidCategorySent() {
        let newsResource = NewsResource()
        let expectation = self.expectation(description: "NewsAPIWhenInvalidCategorySent")
        
        newsResource.getNews(category: "notACategory") { result in
            XCTAssertEqual(result?.articles?.count, 0)
            XCTAssertEqual(result?.status, "ok")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
}
