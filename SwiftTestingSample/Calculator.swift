//
//  Calculator.swift
//  SwiftTestingSample
//
//  Created by 佐藤汰一 on 2025/01/28.
//

enum Calculator {
    
    static func multiplication(_ value1: Double, _ value2: Double) -> Double {
        
        return value1 * value2
    }
    
    static func division(_ value1: Double, _ value2: Double) -> Double? {
        
        if value2 == .zero {
            
            return nil
        }
        
        return value1 / value2
    }
}
