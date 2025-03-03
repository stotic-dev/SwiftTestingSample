//
//  InputText.swift
//  SwiftTestingSample
//
//  Created by 佐藤汰一 on 2025/03/02.
//

enum InputText {
    
    static func canSave(text: String) -> Bool {
         
        let regex = /([0-9]|[a-z]|[A-Z])+/
        guard let _ = text.wholeMatch(of: regex) else { return false }
        return true
    }
}
