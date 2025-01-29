//
//  Store.swift
//  SwiftTestingSample
//
//  Created by 佐藤汰一 on 2025/01/28.
//

struct Store {
    
    private var handler: (Event) -> Void = { _ in }
    
    func onAppear() {
        
        handler(.onAppear)
    }
    
    func onDisappear() {
        
        handler(.onDisappear)
    }
    
    mutating func watch(_ handler: @escaping (Event) -> Void) {
        
        self.handler = handler
    }
}

extension Store {
    
    enum Event {
        
        case onAppear
        case onDisappear
    }
}
