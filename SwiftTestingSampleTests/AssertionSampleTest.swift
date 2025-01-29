//
//  AssertionSampleTest.swift
//  SwiftTestingSample
//
//  Created by 佐藤汰一 on 2025/01/28.
//

import Testing
@testable import SwiftTestingSample

struct AssertionSampleTest {
    
    struct CalculatorTest {
        
        struct MultiplicationTest {}
        struct DivisionTest {}
    }
    
    struct StoreTest {}
}

extension AssertionSampleTest.StoreTest {
    
    @Test
    func 表示すると表示イベントを出力する() async throws {
        
        var store = Store()
        
        await confirmation { complete in
            
            store.watch { event in
                
                #expect(event == .onAppear)
                complete()
            }
            
            store.onAppear()
        }
    }
}

extension AssertionSampleTest.CalculatorTest.DivisionTest {
    
    @Test
    func 割り算は右辺左辺いずれも有限の数値であれば左辺を右辺で割った値を返す() throws {
        
        let result = try Calculator.division(10, 2)
        #expect(5 == result)
    }
    
    @Test
    func 割り算は右辺左辺いずれも有限の数値であれば左辺を右辺で割った値を返す_2() throws {
        
        let unwrapResult = try #require(try Calculator.division(10, 2))
        #expect(5 == unwrapResult)
    }
    
    @Test(.disabled("絶対失敗するケースなので、無効にする"))
    func 割り算は右辺左辺いずれも有限の数値であれば左辺を右辺で割った値を返す_3() throws {
        
        let result = Double.nan
        
        if result.isNaN {
            
            Issue.record("結果がNanのためテスト失敗")
        }
        
        #expect(5 == result)
    }
    
    @Test
    func 割り算は右辺が有限の数値でなければ例外を返す() throws {
        
        #expect(throws: CalculateError.self, performing: {
            
            let _ = try Calculator.division(10, .infinity)
        })
    }
    
    @Test
    func 割り算は左辺が有限の数値でなければ例外を返す() throws {
        
        #expect(throws: CalculateError.self, performing: {
            
            let _ = try Calculator.division(.nan, 2)
        })
    }
}
