//
//  TaskViewModel.swift
//  TodoAppForTestAssignment
//
//  Created by NEIHT on 1/2/26.
//

import Foundation

class TaskViewModel : ObservableObject{
    
    private let dataService = TaskDataService()
    
    @Published var taskItems: [TaskModel] = [] {
        didSet{
            dataService.saveTaskItems(taskItems: taskItems)
        }
    }
    
    init() {
        getTaskItems()
    }
    
    func getTaskItems() {
        self.taskItems = dataService.loadTaskItems()
    }
    
    func deleteTask(at offsets: IndexSet) {
        taskItems.remove(atOffsets: offsets)
    }

    func moveTask(from source: IndexSet, to destination: Int) {
        taskItems.move(fromOffsets: source, toOffset: destination)
    }
    
    func addNewTask(taskContent: String) {
        let newTask = TaskModel(taskContent: taskContent)
        taskItems.append(newTask)
    }
    
    func updateTaskStatus(task: TaskModel) {
        if let index = taskItems.firstIndex(where: {$0.id == task.id}){
            taskItems[index].isCompleted.toggle()
        }
    }
}

