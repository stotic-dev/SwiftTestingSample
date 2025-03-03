//
//  InputTextTest.swift
//  SwiftTestingSampleTests
//
//  Created by 佐藤汰一 on 2025/03/02.
//

import Testing

@testable import SwiftTestingSample

struct InputTextTest {

    @Test(arguments: [
        ("1234", true),
        ("akife", true),
        ("akIf", true),
        ("AAkd13", true),
        ("////", false),
        ("sei@", false),
        ("", false),
    ])
    func テキストを保存するかどうかを判定する(input: String, expected: Bool) async throws {
        
        let result = InputText.canSave(text: input)
        
        #expect(result == expected)
    }

    @Test(arguments: [
        ("1234", true),
        ("akife", true),
        ("akIf", true),
        ("AAkd13", true),
    ])
    func テキストに数字とアルファベット以外の文字が入っていれば保存できる(
        input: String,
        expected: Bool
    ) async throws {
        
        let result = InputText.canSave(text: input)
        
        #expect(result == expected)
    }
    
    @Test(arguments: [
        ("////", false),
        ("sei@", false),
        ("", false),
    ])
    func テキストに数字とアルファベット以外の文字が入っていれば保存できない(
        input: String,
        expected: Bool
    ) async throws {
        
        let result = InputText.canSave(text: input)
        
        #expect(result == expected)
    }


}
