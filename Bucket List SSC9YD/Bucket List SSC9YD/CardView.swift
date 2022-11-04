//
//  CardView.swift
//  Bucket List SSC9YD
//
//  Created by Sid on 11/4/22.
//

import SwiftUI



struct CardView: View {
    let task: Task
    
    var body: some View {
        VStack (alignment: .leading){
            Text(task.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(task.duedateObj.formatted(date: .numeric, time: .omitted))", systemImage: "clock")
                    .labelStyle(.styleIcon)
                Spacer()
                if (task.complete){
                    Label("", systemImage: "checkmark")
                        .font(.headline)
                }
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(task.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var task = Task.sampleData[0]
    static var previews: some View {
        CardView(task: task)
            .background(task.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
