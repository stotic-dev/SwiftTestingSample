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
        
        #expect(expected == Calculator.multiplication(right, left))
    }
    
    @Test(
        arguments: [2, 0, 5], [5, 0]
    )
    func 掛け算は左辺と右辺を掛けた値を返す_直積(
        right: Double,
        left: Double
    ) throws {
        
        #expect(right * left == Calculator.multiplication(right, left))
    }
    
    @Test(
        arguments: zip([2, 0, 5],[5, 5, 0])
    )
    func 掛け算は左辺と右辺を掛けた値を返す_分解(
        right: Double,
        left: Double
    ) throws {
        
        #expect(right * left == Calculator.multiplication(right, left))
    }
}
