//
//  ContentView.swift
//  TodoList
//
//  Created by 정현민 on 11/17/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TodoViewModel()
    @State private var newTodoTitle = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("New Todo", text: $newTodoTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // 최신 SwiftUI Button 문법
                Button {
                    guard !newTodoTitle.isEmpty else { return }
                    viewModel.add(newTodoTitle)
                    newTodoTitle = ""
                } label: {
                    Text("+")
                        .font(.title2)
                        .padding(6)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            List {
                ForEach(viewModel.todos) { todo in
                    HStack {
                        Text(todo.title)
                            .strikethrough(todo.checking) // isCompleted -> checking
                        Spacer()
                        Button {
                            viewModel.toggle(todo)
                        } label: {
                            Text(todo.checking ? "Undo" : "Done")
                        }
                        .buttonStyle(.bordered)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { viewModel.remove(id: viewModel.todos[$0].id) }
                }
            }
        }
    }
}

// 최신 SwiftUI PreviewProvider 방식
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
