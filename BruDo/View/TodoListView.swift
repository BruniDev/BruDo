//
//  TodoListView.swift
//  BruDo
//
//  Created by 정현 on 2023/09/02.
//

import SwiftUI
import CoreData

struct TodoListView: View {
    @State var makeTodoShownSheet = false
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.timestamp, ascending: true)],
        animation: .default)
    private var todos: FetchedResults<Todo>
    
    
    var body: some View {
        NavigationView{
            VStack{
//                NavigationLink(destination: TodoMakeSheet()) {
//                 Text("Button")
//                }

                List{
                    ForEach(todos) {todo in
                        NavigationLink{
                            Text("FEFE")
                        } label: {
                            Text(todo.title ?? " ")
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement : .navigationBarTrailing){
                    Button()
                    {
                        print("Add Item")
                       
                    } label :
                    {
                        NavigationLink(destination: TodoMakeSheet()){
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
    
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
