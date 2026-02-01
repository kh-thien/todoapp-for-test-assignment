//
//  TodoAppForTestAssignmentApp.swift
//  TodoAppForTestAssignment
//
//  Created by NEIHT on 1/2/26.
//

import SwiftUI

@main
struct TodoAppForTestAssignmentApp: App {
    @StateObject var taskViewModel : TaskViewModel = TaskViewModel()
    var body: some Scene {
        WindowGroup {
                TaskListView()
        }.environmentObject(taskViewModel)
    }
}

