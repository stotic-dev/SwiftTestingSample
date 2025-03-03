//
//  ContentViewModel.swift
//  SwiftTestingSample
//
//  Created by 佐藤汰一 on 2025/03/01.
//

import Observation

@Observable
final class ContentViewModel {
    
    var title = ""
    var message = ""
    var inputText = ""
    
    func onAppear() {
        
        title = "Hello World!!"
        message = MessageGenerator().getMessage()
    }
    
    func tappedButton() {
        
        if title == "Hello World!!" {
            
            title = "Good Bye World!!"
        }
        else {
            
            title = "Hello World!!"
        }
    }
    
    func tappedInputTextButton() {
        
        if InputText.canSave(text: inputText) {
            
            print("Saved!")
            inputText = ""
        }
    }
}

extension ContentViewModel: Equatable {
    
    static func == (lhs: ContentViewModel, rhs: ContentViewModel) -> Bool {
        
        return lhs.title == rhs.title && lhs.message == rhs.message
    }
}
