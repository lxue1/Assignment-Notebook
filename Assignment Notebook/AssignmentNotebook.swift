//
//  AssignmentNotebook.swift
//  Assignment Notebook
//
//  Created by Luke Xue on 7/28/21.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "Computer Science", description: "Description", dueDate: Date()),
                            AssignmentItem(course: "Math", description: "Description", dueDate: Date()),
                            AssignmentItem(course: "English", description: "Description", dueDate: Date())]
 }
