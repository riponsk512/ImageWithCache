//
//  ImageWithCacheTests.swift
//  ImageWithCacheTests
//
//  Created by Ripon sk on 15/04/24.
//

import XCTest
@testable import ImageWithCache

final class ImageWithCacheTests: XCTestCase {

    func test_ServerApi(){
        let expectation = expectation(description: "server_Api")
        Task{
            try await  fetchServerData.shared.fetchData{
                data in
                XCTAssertNotNil(data)
                XCTAssertEqual(data.first?.thumbnail?.domain as? String ?? "", "https://cimg.acharyaprashant.org")
                expectation.fulfill()
            }
        }
       
        waitForExpectations(timeout: 50, handler: nil)
        
    }

}
