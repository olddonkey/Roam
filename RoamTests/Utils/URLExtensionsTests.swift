//
//  URLExtensionsTests.swift
//  RoamTests
//
//  Created by olddonkey on 2018/3/17.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import XCTest
@testable import Roam

class URLExtensionsTests: XCTestCase {
    
    var url = URL(string: "https://www.google.com")!
    let params = ["q": "swifter swift"]
    let queryUrl = URL(string: "https://www.google.com?q=swifter%20swift")!
    
    func testAppendingQueryParameters() {
        XCTAssertEqual(url.appendingQueryParameters(params), queryUrl)
    }
    
    func testAppendQueryParameters() {
        url.appendQueryParameters(params)
        XCTAssertEqual(url, queryUrl)
    }
    
    func testQueryParameters() {
        let url = URL(string: "https://www.google.com?q=swifter%20swift&steve=jobs&empty")!
        guard let parameters = url.queryParameters else {
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(parameters.count, 2)
        XCTAssertEqual(parameters["q"], "swifter swift")
        XCTAssertEqual(parameters["steve"], "jobs")
        XCTAssertEqual(parameters["empty"], nil)
    }
    

}
