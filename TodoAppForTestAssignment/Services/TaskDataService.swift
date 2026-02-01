//
//  TaskDataService.swift
//  TodoAppForTestAssignment
//
//  Created by NEIHT on 1/2/26.
//

import Foundation

class TaskDataService {
    
    private let taskItemsKey = "taskItems"
    
    func saveTaskItems( taskItems: [TaskModel]) {
        if let encodeData = try? JSONEncoder().encode(taskItems) {
            UserDefaults.standard.set(encodeData, forKey: taskItemsKey)
        }
    }
    
    // MARK: - Load Data
    func loadTaskItems() -> [TaskModel] {
        guard
            let data = UserDefaults.standard.data(forKey: taskItemsKey),
            let savedTaskItems = try? JSONDecoder().decode([TaskModel].self, from: data)
        else {
            return []
        }
        return savedTaskItems
    }
    
    func deleteAllTaskItems() {
        UserDefaults.standard.removeObject(forKey: taskItemsKey)
    }
}
