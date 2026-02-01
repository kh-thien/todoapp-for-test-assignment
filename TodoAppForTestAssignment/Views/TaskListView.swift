//
//  TaskListView.swift
//  TodoAppForTestAssignment
//
//  Created by NEIHT on 1/2/26.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskViewModel :TaskViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(taskViewModel.taskItems) { item in
                    TaskView(taskItems: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                taskViewModel.updateTaskStatus(task: item)
                                
                            }
                        }
                }
                .onDelete(perform: taskViewModel.deleteTask)
                .onMove(perform: taskViewModel.moveTask)
            }
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add") {
                        AddTaskView()
                    }
                }
            }
        }
    }

   
}


#Preview {
    TaskListView()
        .environmentObject(TaskViewModel())
}
