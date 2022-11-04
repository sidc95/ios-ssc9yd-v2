//
//  ListView.swift
//  Bucket List SSC9YD
//
//  Created by Sid on 11/4/22.
//

import SwiftUI

struct ListView: View {
    @Binding var tasks: [Task]
    
    @State private var isPresentingNewTaskView = false
    @State private var newTaskData = Task.Data()
    
    var body: some View {
        VStack {
            List {
                ForEach($tasks.filter{ $task in !task.complete} ) { $task in

                    NavigationLink(destination: DetailView(task:$task, tasks: $tasks)) {
                        CardView(task: task)
                            
                    }
                    .listRowBackground(task.theme.mainColor)
                }
            }
            .refreshable {
                tasks = tasks.sorted(by: {$0.duedateObj.compare($1.duedateObj) == .orderedAscending})
            }
            .navigationTitle("Bucket List")
            .toolbar{
                Button(action: {
                    isPresentingNewTaskView = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentingNewTaskView){
                NavigationView {
                    DetailEditView(data: $newTaskData)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingNewTaskView = false
                                    newTaskData = Task.Data()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    let newTask = Task(data: newTaskData)
                                    tasks.append(newTask)
                                    tasks = tasks.sorted(by: {$0.duedateObj.compare($1.duedateObj) == .orderedAscending})
                                    isPresentingNewTaskView = false
                                    newTaskData = Task.Data()
                                }
                            }
                        }
                }
            }
            VStack{
                Text("Complete")
                    .font(.headline)
                Spacer()
                List {
                    ForEach($tasks.filter{ $task in task.complete} ) { $task in
                        NavigationLink(destination: DetailView(task:$task, tasks: $tasks)) {
                            CardView(task: task)

                        }
                        .listRowBackground(task.theme.mainColor)
                    }
                }
                .navigationTitle("Completed")
            }

        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            ListView(tasks: .constant(Task.sampleData))
        }

    }
}
