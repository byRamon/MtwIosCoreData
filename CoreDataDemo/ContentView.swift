//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by ByRamon on 25/03/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Student.entity(), sortDescriptors:[]) var students: FetchedResults<Student>
    var body: some View {
        VStack {
            List{
                ForEach(students, id: \.id){ student in
                    Text(student.name ?? "Unknow")
                }
            }
            Button("Add"){
                let firstName = ["Alonso","Carlos","Adriana","Luna", "Jose"]
                let lastName = ["Gonzalez","Perez","Garcia","Lopez"]
                let chosenFirstName = firstName.randomElement()!
                let chosenLastName = lastName.randomElement()!
                let student = Student(context:self.context)
                student.name = "\(chosenFirstName) \(chosenLastName)"
                student.id = UUID()
                try? self.context.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
