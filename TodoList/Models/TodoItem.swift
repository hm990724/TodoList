//
//  TodoItem.swift
//  TodoList
//
//  Created by 정현민 on 11/17/25.
//
import Foundation

struct TodoItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var checking: Bool = false
    
    init(id: UUID = UUID(), title: String, checking: Bool = false){
        self.id = id
        self.title = title
        self.checking = checking
    }
    
}

