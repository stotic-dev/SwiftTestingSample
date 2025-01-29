//
//  Calculator.swift
//  SwiftTestingSample
//
//  Created by 佐藤汰一 on 2025/01/28.
//

enum Calculator {
    
    static func multiplication(_ value1: Double, _ value2: Double) throws -> Double {
        
        guard isValidInput(value1), isValidInput(value2) else {
            
            throw CalculateError()
        }
        return value1 * value2
    }
    
    static func division(_ value1: Double, _ value2: Double) throws -> Double? {
        
        guard isValidInput(value1), isValidInput(value2) else {
            
            throw CalculateError()
        }
        
        if value2 == .zero {
            
            return nil
        }
        
        return value1 / value2
    }
}

private extension Calculator {
    
    static func isValidInput(_ value: Double) -> Bool {
        
        return !(value.isNaN || value.isInfinite || value.isSignalingNaN)
    }
}

struct CalculateError: Error {}
