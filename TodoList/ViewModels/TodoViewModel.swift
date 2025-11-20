//
//  TodoViewModel.swift
//  TodoList
//
//  Created by 정현민 on 11/17/25.
//

import Foundation
import Combine

class TodoViewModel: ObservableObject{
    @Published var todos: [TodoItem] = []
    
    func add(_ title: String) {
        guard !title.isEmpty else {return}
        todos.append(TodoItem(title: title))
    }
    
    func toggle(_ todo: TodoItem) {
        if let i = todos.firstIndex(where: { $0.id == todo.id }){
            todos[i].checking.toggle()
        }
    }
    
    func remove(id: UUID) {
        todos.removeAll(where: { $0.id == id })
    }
    
}


