//
//  DetailView.swift
//  Bucket List SSC9YD
//
//  Created by Sid on 11/4/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var task: Task
    @Binding var tasks: [Task]
    
    @State private var data = Task.Data()
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section() {
                Text(task.title)
                HStack {
                    Label("Due Date", systemImage: "clock")
                    Spacer()
                    Text("\(task.duedateObj.formatted(date: .numeric, time: .omitted))")
                }
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(task.theme.name)
                        .padding(4)
                        .foregroundColor(task.theme.accentColor)
                        .background(task.theme.mainColor)
                        .cornerRadius(4)
                }
                HStack {
                    Toggle("Task Status", isOn: $task.complete)
                }
            }
        }
        .navigationTitle("Task Info")
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = task.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(task.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                task.update(from: data)
                                tasks = tasks.sorted(by: {$0.duedateObj.compare($1.duedateObj) == .orderedAscending})
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(task: .constant(Task.sampleData[0]), tasks: .constant(Task.sampleData))
        }
    }
}
