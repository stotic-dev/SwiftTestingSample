//
//  ContentView.swift
//  SwiftTestingSample
//
//  Created by 佐藤汰一 on 2025/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.title)
            Text(viewModel.message)
                .font(.largeTitle)
            Button {
                viewModel.tappedButton()
            } label: {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            TextField(text: $viewModel.inputText) {
                Text("input")
            }
        }
        .padding()
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    ContentView(viewModel: .init())
}
