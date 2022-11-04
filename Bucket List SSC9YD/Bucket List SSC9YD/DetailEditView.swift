//
//  DetailEditView.swift
//  Bucket List SSC9YD
//
//  Created by Sid on 11/4/22.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var data: Task.Data
    
    var body: some View {
        Form {
            Section(header: Text("Task Info")) {
                TextField("Title", text: $data.title)
                HStack{
                    DatePicker("Due Date", selection: $data.duedateObj,
                               displayedComponents: [.date])
                }
                ThemePicker(selection: $data.theme)
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Task.sampleData[0].data))
    }
}
