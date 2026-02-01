//
//  TaskModel.swift
//  TodoAppForTestAssignment
//
//  Created by NEIHT on 1/2/26.
//

import Foundation
struct TaskModel: Identifiable , Codable{
    let id: UUID
    var taskContent: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), taskContent: String) {
        self.id = id
        self.taskContent = taskContent
        self.isCompleted = false
    }
}
