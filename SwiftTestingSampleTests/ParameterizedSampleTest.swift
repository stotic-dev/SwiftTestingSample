//
//  ParameterizedSampleTest.swift
//  SwiftTestingSampleTests
//
//  Created by 佐藤汰一 on 2025/01/28.
//

import Testing
@testable import SwiftTestingSample

struct ParameterizedSampleTest {
    
    struct CalculatorTest {
        
        struct MultiplicationTest {}
    }
}

extension ParameterizedSampleTest.CalculatorTest.MultiplicationTest {
    
    @Test(
        "掛け算は左辺*右辺の値を返す。左辺右辺どちらかが有限の数でないもしくはNanの場合は例外を返す。",
        .serialized,
        arguments: [
        (2, 5, 10),
        (0, 5, 0),
        (5, 0, 0),
        (Double.nan, 5, nil),
        (5, Double.nan, nil),
        (Double.infinity, 5, nil),
        (5, Double.infinity, nil)
    ])
    func 掛け算は左辺と右辺を掛けた値を返す(
        right: Double,
        left: Double,
        expected: Double?
    ) throws {
        
        if let expected {
            
            let result = try #require(try Calculator.multiplication(right, left))
            #expect(expected == result)
        }
        else {
            
            #expect(throws: CalculateError.self, performing: {
                
                let _ = try Calculator.multiplication(right, left)
            })
        }
    }
    
    @Test(arguments: [
        (2, 5, 10),
        (0, 5, 0),
        (5, 0, 0)
    ])
    func 掛け算は左辺と右辺を掛けた値を返す(
        right: Double,
        left: Double,
        expected: Double
    ) throws {
        
        let result = try Calculator.multiplication(right, left)
        
        #expect(expected == result)
    }
    
    @Test(
        arguments: [2, 0, 5], [5, 0]
    )
    func 掛け算は左辺と右辺を掛けた値を返す_直積(
        right: Double,
        left: Double
    ) throws {
        
        let result = try Calculator.multiplication(right, left)
        
        #expect(right * left == result)
    }
    
    @Test(
        arguments: zip([2, 0, 5],[5, 5, 0])
    )
    func 掛け算は左辺と右辺を掛けた値を返す_分解(
        right: Double,
        left: Double
    ) throws {
        
        let result = try Calculator.multiplication(right, left)
        #expect(right * left == result)
    }
}
