//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Luke Xue on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
            [AssignmentItem(course: "Computer Science", description: "Description", dueDate: Date()),
             AssignmentItem(course: "Math", description: "Description", dueDate: Date()),
             AssignmentItem(course: "English", description: "Description", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    Text(item.description)
                }
            }
            .navigationBarTitle("Assignments", displayMode: .inline)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
