//
//  HomeViewModel.swift
//  coreData_V1.0
//
//  Created by emm on 27/12/2020.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    
    // For NewData Sheet...
    @Published var isNewData = false
    
    // Checking And Updating Date ...
    
    let calender = Calendar.current
    
    func checkDate()->String {
        if calender.isDateInToday(date){
            return "Today"
        }
        else if calender.isDateInTomorrow(date) {
            return "Tomorrow"
        }
        else {
            return "Other day"
        }
    }
    
    func updateDate(value: String) {
        if value == "Today" { date = Date()}
        else if value == "Tomorrow" {
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        }else {
            // do something...
        }
    }
    
    func writeData(context: NSManagedObjectContext) {
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        // saving data
        do {
            try context.save()
            // succes means closing view...
            isNewData.toggle()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
