//
//  NotesViewModel.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI
import CoreData

final class NotesViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currCur = "EUR/USD"
    @AppStorage("currentCurrency") var currentCurrency = ""

    @AppStorage("city") var city = ""
    @Published var gorod = ""

    @Published var notTitle: String = ""
    @Published var notNote: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isAddCity: Bool = false
    @Published var isAddStatistics: Bool = false
    @Published var isDelete: Bool = false


    @Published var notes: [NotesModel] = []
    @Published var selectedNote: NotesModel?

    func addNote() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "NotesModel", into: context) as! NotesModel

        loan.notTitle = notTitle
        loan.notNote = notNote

        CoreDataStack.shared.saveContext()
    }
    
    func fetchNotes() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesModel>(entityName: "NotesModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.notes = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.notes = []
        }
    }
}
