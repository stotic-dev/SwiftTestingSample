//
//  SwiftTestingSampleTests.swift
//  SwiftTestingSampleTests
//
//  Created by 佐藤汰一 on 2025/01/26.
//

import Testing
@testable import SwiftTestingSample

@Suite(.tags(.stable))
struct CalculatorTest {
    
    struct MultiplicationTest {
        
        @Test
        func 掛け算は左辺と右辺を掛けた値を返す() throws {
            
            #expect(10 == Calculator.multiplication(2, 5))
        }
        
        @Test
        func 掛け算は左辺に0があると右辺の値に関わらず0を返す() throws {
            
            #expect(0 == Calculator.multiplication(0, 5))
        }
        
        @Test
        func 掛け算は右辺に0があると左辺の値に関わらず0を返す() throws {
            
            #expect(0 == Calculator.multiplication(5, 0))
        }
    }
    
    struct DivisionTest {
        
        @Test(.bug(id: "12-345"))
        func 割り算は右辺が0でなければ左辺を右辺で割った値を返す() throws {
            
            #expect(5 == Calculator.division(10, 2))
        }
        
        @Test(.bug("https://developer.apple.com/documentation/testing/trait/bug(_:_:)"))
        func 割り算は右辺が0の場合はnilを返す() throws {
            
            #expect(nil == Calculator.division(10, 0))
        }
    }
}
