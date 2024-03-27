//
//  IncomeViewModel.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI
import CoreData

final class IncomeViewModel: ObservableObject {

    @AppStorage("city") var city = ""
    @Published var gorod = ""
    
    @AppStorage("money") var money = ""
    @Published var dengi = ""
    @AppStorage("spent") var spent = ""
    @Published var chasi = ""

    @Published var operations: [String] = ["Income", "Expenses"]
    @Published var currentOper = "Income"
    @Published var currentAddOper = ""
        
    @Published var incTitle: String = ""
    @Published var incDate: String = ""
    @Published var incHours: String = ""
    @Published var incMoney: String = ""
    @Published var incNote: String = ""
    @Published var incOper: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isAddCity: Bool = false
    @Published var isAddStatistics: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false

    @Published var incomes: [IncomeModel] = []
    @Published var selectedIncome: IncomeModel?

    func addIncome() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "IncomeModel", into: context) as! IncomeModel

        loan.incTitle = incTitle
        loan.incDate = incDate
        loan.incHours = incHours
        loan.incMoney = incMoney
        loan.incNote = incNote
        loan.incOper = incOper

        CoreDataStack.shared.saveContext()
    }
    
    func fetchIncomes() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<IncomeModel>(entityName: "IncomeModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.incomes = result.filter{($0.incOper ?? "") == currentOper}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.incomes = []
        }
    }
}
