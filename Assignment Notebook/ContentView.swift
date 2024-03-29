//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Luke Xue on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .foregroundColor(Color.blue)
                                .bold()
                                .font(.headline)
                            Text(item.description)
                                .foregroundColor(Color.red)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                            .foregroundColor(Color.red)
                    }
            }
                .onMove(perform: { indices, newOffset in
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            
            .navigationBarTitle("Assignments", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                        trailing: Button(action: {
                            showingAddAssignmentView = true}) {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.red)
                                })
        }
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
