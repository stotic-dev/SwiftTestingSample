//
//  SuccessTest.swift
//  SwiftTestingSampleTests
//
//  Created by 佐藤汰一 on 2025/03/07.
//

import XCTest

final class SuccessTest: XCTestCase {

    func test_skelton_success() async throws {
        try await Task.sleep(nanoseconds: 10000)
        XCTAssertTrue(true)
    }
    
    func test_sample()  {
        let expectation = XCTestExpectation()
        
        HogeRepository.fetch { result in
            switch result {
            case .success(let success):
                XCTAssertEqual(success, "hoge")
            case .failure(let failure):
                XCTFail()
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}

struct HogeRepository {
    
    static func fetch(completion: @escaping (Result<String, Error>) -> Void) {
        DispatchQueue.main.async {
            completion(.success("hoge"))
        }
    }
}
