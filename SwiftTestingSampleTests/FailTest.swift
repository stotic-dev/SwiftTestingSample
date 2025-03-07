//
//  FailTest.swift
//  SwiftTestingSampleTests
//
//  Created by 佐藤汰一 on 2025/03/06.
//

import XCTest

final class FailTest: XCTestCase {

    func test_skelton_fail() {
        DispatchQueue.main.async {
            sleep(10)
            XCTFail()
        }
    }
}
