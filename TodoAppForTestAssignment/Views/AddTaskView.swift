import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
@EnvironmentObject var taskViewModel: TaskViewModel
    @State private var taskTextField: String = ""
    @State var alertMessage : String = ""
    @State var showAlert : Bool = false
    

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {

                    TextField("Type a new task...", text: $taskTextField)
                        .padding()
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)

                   
                    if(!taskTextField.isEmpty){
                        Button {
                            saveTask()
                           
                        } label: {
                            Text("Save")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                    
                }
                .padding(16)
            }
            .navigationTitle("Add Task")
            .alert(isPresented: $showAlert,content: getAlert )
        }
    }
    func saveTask() {
        if !textIsApproiate() {
            return
        }
        taskViewModel.addNewTask(taskContent: taskTextField)
        presentationMode.wrappedValue.dismiss()
    }
    func textIsApproiate() -> Bool {
        if(taskTextField.count < 3 ) {
            alertMessage = "Task must be at least 3 characters long"
            showAlert = true
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
}

#Preview {
    AddTaskView()
        .environmentObject(TaskViewModel())
}
