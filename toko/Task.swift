//
//  Task.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 11/03/25.
//

//learning class and struct

//import SwiftUI
//
//// 1️⃣ Struct: Task Model (Immutable Data)
//struct Task: Identifiable {
//    let id = UUID()
//    let title: String
//    var isCompleted: Bool = false
//}
//
//// 2️⃣ Class: TaskViewModel (Shared State)
//class TaskViewModel: ObservableObject {
//    @Published var tasks: [Task] = [
//        Task(title: "Buy groceries"),
//        Task(title: "Walk the dog"),
//        Task(title: "Read a book")
//    ]
//    
//    // Function to add a new task
//    func addTask(title: String) {
//        let newTask = Task(title: title)
//        tasks.append(newTask)
//    }
//    
//    // Function to mark a task as completed
//    func toggleTaskCompletion(task: Task) {
//        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
//            tasks[index].isCompleted.toggle()
//        }
//    }
//}
//
//// 3️⃣ SwiftUI View: Displays and manages tasks
//struct TaskView: View {
//    @StateObject var viewModel = TaskViewModel()
//    @State private var newTaskTitle: String = ""
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Input field to add a task
//                HStack {
//                    TextField("New Task", text: $newTaskTitle)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    Button("Add") {
//                        if !newTaskTitle.isEmpty {
//                            viewModel.addTask(title: newTaskTitle)
//                            newTaskTitle = "" // Clear input
//                        }
//                    }
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//                }
//                .padding()
//
//                // List of tasks
//                List {
//                    ForEach(viewModel.tasks) { task in
//                        HStack {
//                            Text(task.title)
//                                .strikethrough(task.isCompleted)
//                            Spacer()
//                            Button(action: {
//                                viewModel.toggleTaskCompletion(task: task)
//                            }) {
//                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
//                                    .foregroundColor(task.isCompleted ? .green : .gray)
//                            }
//                        }
//                        .padding()
//                    }
//                }
//            }
//            .navigationTitle("Task Manager")
//        }
//    }
//}
//
//// 4️⃣ Preview for SwiftUI Canvas
//#Preview {
//    TaskView()
//}
