//
//  Task.swift
//  Bucket List SSC9YD
//
//  Created by Sid on 11/4/22.
//

import Foundation



struct Task: Identifiable{
    let id: UUID
    var title: String
    var duedate: String
    var duedateObj: Date
    var complete: Bool
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, duedate: String, duedateObj: Date, complete: Bool, theme: Theme) {
        self.id = id
        self.title = title
        self.duedate = duedate
        self.duedateObj = duedateObj
        self.complete = complete
        self.theme = theme
    }
    
}

extension Task {
    struct Data {
        var title: String = ""
        var duedate: String = ""
        var duedateObj: Date = Date()
        var complete: Bool = false
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(title: title, duedate: duedate, duedateObj: duedateObj, complete: complete, theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        duedate = data.duedate
        duedateObj = data.duedateObj
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        duedate = data.duedate
        duedateObj = data.duedateObj
        complete = data.complete
        theme = data.theme
    }
}



extension Task {
    
    static  let sampleData: [Task] =
    [
        Task(title: "First Day of Class", duedate: Date(timeIntervalSinceReferenceDate: 682992000).formatted(date: .numeric, time: .omitted), duedateObj: Date(timeIntervalSinceReferenceDate: 682992000), complete: false, theme: .yellow),
        Task(title: "Halloween", duedate: Date(timeIntervalSinceReferenceDate: 688953600).formatted(date: .numeric, time: .omitted), duedateObj: Date(timeIntervalSinceReferenceDate: 688953600), complete: false, theme: .seafoam),
        Task(title: "Last Day of Class", duedate: Date(timeIntervalSinceReferenceDate: 692064000).formatted(date: .numeric, time: .omitted), duedateObj: Date(timeIntervalSinceReferenceDate: 692064000), complete: false, theme: .periwinkle)
    ]
}


