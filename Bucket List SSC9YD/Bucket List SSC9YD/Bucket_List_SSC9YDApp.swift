//
//  Bucket_List_SSC9YDApp.swift
//  Bucket List SSC9YD
//
//  Created by Sid on 11/4/22.
//
// Citations: This app was built with the help of iOS App Dev Tutorials: Develop apps for iOS (14hr 40min tutorial course)
// Website: https://developer.apple.com/tutorials/app-dev-training
//
//


import SwiftUI

@main
struct Bucket_List_SSC9YDApp: App {
    @State private var tasks = Task.sampleData.sorted(by: {$0.duedateObj.compare($1.duedateObj) == .orderedAscending})
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                ListView(tasks: $tasks)
            }
        }
    }
}
