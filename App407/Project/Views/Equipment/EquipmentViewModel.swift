//
//  EquipmentViewModel.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI
import CoreData

final class EquipmentViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currCur = "EUR/USD"
    @AppStorage("currentCurrency") var currentCurrency = ""

    @AppStorage("city") var city = ""
    @Published var gorod = ""
    
    @AppStorage("EquipmentMoney") var EquipmentMoney = ""
    @Published var Edengi = ""

    @Published var eqTitle: String = ""
    @Published var eqDate: String = ""
    @Published var eqMoney: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isAddCity: Bool = false
    @Published var isAddStatistics: Bool = false
    @Published var isDelete: Bool = false


    @Published var equipments: [EquipModel] = []
    @Published var selectedEquipment: EquipModel?

    func addEquipment() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EquipModel", into: context) as! EquipModel

        loan.eqTitle = eqTitle
        loan.eqDate = eqDate
        loan.eqMoney = eqMoney

        CoreDataStack.shared.saveContext()
    }
    
    func fetchEquipments() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EquipModel>(entityName: "EquipModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.equipments = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.equipments = []
        }
    }
}
