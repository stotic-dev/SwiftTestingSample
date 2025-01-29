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
    
    @Test
    func 掛け算は左辺と右辺を掛けた値を返す() throws {
        
        let result = try Calculator.multiplication(2, 5)
        
        #expect(10 == result)
    }
    
    @Test
    func 掛け算は左辺に0があると右辺の値に関わらず0を返す() throws {
        
        let result = try Calculator.multiplication(0, 5)
        
        #expect(0 == result)
    }
    
    @Test
    func 掛け算は右辺に0があると左辺の値に関わらず0を返す() throws {
        
        let result = try Calculator.multiplication(5, 0)
        
        #expect(0 == result)
    }
    
    @Test(.bug(id: "12-345"))
    func 割り算は右辺が0でなければ左辺を右辺で割った値を返す() throws {
        
        let result = try Calculator.division(10, 2)
        
        #expect(5 == result)
    }
    
    @Test(
        .bug("https://github.com/stotic-dev/SwiftTestingSample/issues/2"),
        .bug("https://github.com/stotic-dev/SwiftTestingSample/pull/1")
    )
    func 割り算は右辺が0の場合はnilを返す() throws {
        
        let result = try Calculator.division(10, 0)
        
        #expect(nil == result)
    }
    
    struct MultiplicationTest {
        
//        @Test
//        func 掛け算は左辺と右辺を掛けた値を返す() throws {
//            
//            let result = try Calculator.multiplication(2, 5)
//            
//            #expect(10 == result)
//        }
//        
//        @Test
//        func 掛け算は左辺に0があると右辺の値に関わらず0を返す() throws {
//            
//            let result = try Calculator.multiplication(0, 5)
//            
//            #expect(0 == result)
//        }
//        
//        @Test
//        func 掛け算は右辺に0があると左辺の値に関わらず0を返す() throws {
//            
//            let result = try Calculator.multiplication(5, 0)
//            
//            #expect(0 == result)
//        }
    }
    
    struct DivisionTest {
        
//        @Test(.bug(id: "12-345"))
//        func 割り算は右辺が0でなければ左辺を右辺で割った値を返す() throws {
//            
//            let result = try Calculator.division(10, 2)
//            
//            #expect(5 == result)
//        }
//        
//        @Test(
//            .bug("https://github.com/stotic-dev/SwiftTestingSample/issues/2"),
//            .bug("https://github.com/stotic-dev/SwiftTestingSample/pull/1")
//        )
//        func 割り算は右辺が0の場合はnilを返す() throws {
//            
//            let result = try Calculator.division(10, 0)
//            
//            #expect(nil == result)
//        }
    }
}
