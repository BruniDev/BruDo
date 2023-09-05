//
//  TodoMakeSheet.swift
//  BruDo
//
//  Created by 정현 on 2023/09/02.
//

import SwiftUI

struct TodoMakeSheet: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var name : String = ""
    @State var category : String = ""
    @State var time : String = ""
    @State var alarm : Bool = false
    
    var body: some View {
        VStack(alignment: .center){
            TextField("Enter your name", text: $name)
                .disableAutocorrection(true)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            TextField("Enter your category", text: $category)
                .disableAutocorrection(true)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            TextField("Enter your time", text: $time)
                .disableAutocorrection(true)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            Button("Finished"){
                addItem()
            }
        }
    }
    private func addItem() {
        withAnimation {
            let newTodo = Todo(context: viewContext)
            newTodo.title = name
            newTodo.timestamp = Date()
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct TodoMakeSheet_Previews: PreviewProvider {
    static var previews: some View {
        TodoMakeSheet()
    }
}
