//
//  TaskView.swift
//  TodoAppForTestAssignment
//
//  Created by NEIHT on 1/2/26.
//

import SwiftUI

struct TaskView: View {
     let taskItems: TaskModel
        var body: some View {
            HStack {
                Image(systemName: taskItems.isCompleted ? "checkmark.circle.fill" : "circle" )
                Text(taskItems.taskContent)
                Spacer()
            }
    
    }
}

