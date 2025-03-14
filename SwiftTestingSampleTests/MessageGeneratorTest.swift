//
//  MessageGeneratorTest.swift
//  SwiftTestingSampleTests
//
//  Created by 佐藤汰一 on 2025/03/01.
//

import Testing
import XCTest

@testable import SwiftTestingSample

struct MessageGeneratorTest {

    @Test func メッセージを返す() async throws {
        
        let message = try #require(MessageGenerator().getMessage())
        
        #expect(message == "Generated by objective-c message!")
    }

    @Test func メッセージを返す_XCTestを合わせてみる() async throws {
        
        let message = try #require(MessageGenerator().getMessage())
        
        #expect(message == "Generated by objective-c message!")
        XCTAssertEqual(message, "Generated by objective-c message!")
    }
}
