//
//  ContentViewModelTest.swift
//  SwiftTestingSampleTests
//
//  Created by 佐藤汰一 on 2025/03/01.
//

import Testing

@testable import SwiftTestingSample

struct ContentViewModelTest {

    @Test
    func 画面表示時にタイトルとメッセージを表示する() async throws {
        
        let viewModel = ContentViewModel()
        
        viewModel.onAppear()
        
        let expected = ContentViewModel()
        expected.title = "Hello World!!"
        expected.message = "Generated by objective-c message!"
        #expect(viewModel == expected)
    }
    
    @Test(arguments: zip(
        ["Hello World!!", "Good Bye World!!"],
        ["Good Bye World!!", "Hello World!!"]
    ))
    func ボタンタップ時にタイトルの表示を更新する(initial: String, expectedTitle: String) async throws {
        
        let viewModel = ContentViewModel()
        viewModel.title = initial
        
        viewModel.tappedButton()
        
        let expected = ContentViewModel()
        expected.title = expectedTitle
        #expect(viewModel == expected)
    }
}
