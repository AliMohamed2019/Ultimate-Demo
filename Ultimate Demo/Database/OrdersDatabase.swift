//
//  OrdersDatabase.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import SQLite
import Foundation

class OrdersDatabase {
    
    var database: Connection!
    
    let ordersTable = Table("orders")
    let billAmount = Expression<String>("billAmount")
    let billDate = Expression<String>("billDate")
    let billNo = Expression<String>("billNo")
    let billSrl = Expression<String>("billSrl")
    let billType = Expression<String>("billType")
    let delieveryStatusFlag = Expression<String>("delieveryStatusFlag")
    let taxAmount = Expression<String>("taxAmount")
    
    init() {
        createDatabase()
    }
    
    private func createDatabase() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("orders").appendingPathExtension("sqlite3")
            let database = try Connection(fileURL.path)
            self.database = database
            createTable()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func createTable() {
        do {
            try database.run(ordersTable.create(ifNotExists: true) { table in
                table.column(billSrl, primaryKey: true)
                table.column(billNo)
                table.column(billAmount)
                table.column(taxAmount)
                table.column(billDate)
                table.column(billType)
                table.column(delieveryStatusFlag)
            })
        } catch {
            print("Error creating table: \(error)")
        }
    }
    
    func insertOrders(orders: [DeliveryBill]) {
        do {
            try database.transaction {
                for order in orders {
                    let insert = ordersTable.insert(
                        billSrl <- order.billSrl ?? "",
                        billNo <- order.billNo ?? "",
                        billAmount <- order.billAmount ?? "",
                        taxAmount <- order.taxAmount ?? "",
                        billDate <- order.billDate ?? "",
                        billType <- order.billType ?? "",
                        delieveryStatusFlag <- order.delieveryStatusFlag ?? ""
                    )
                    try database.run(insert)
                }
            }
        } catch {
            print("Error inserting data: \(error)")
        }
    }
    
    func filterOrder(isNew: Bool) -> [DeliveryOrderViewModel] {
        var results: [DeliveryOrderViewModel] = []
        let newStatusFlag = "0"
        do {
            let query = ordersTable.filter(isNew ? delieveryStatusFlag == newStatusFlag : delieveryStatusFlag != newStatusFlag)
            for bill in try database.prepare(query) {
                let serial = bill[billSrl]
                let number = bill[billNo]
                let amount = bill[billAmount]
                let tax = bill[taxAmount]
                let date = bill[billDate]
                let type = bill[billType]
                let status = bill[delieveryStatusFlag]
                
                let order = DeliveryOrderViewModel(billSrl: serial, billNo: number, billAmount: amount, taxAmount: tax, billDate: date, billType: type, delieveryStatusFlag: status)
                results.append(order)
            }
            
        } catch {
            print("Error filtering data: \(error)")
        }
        
        return results
    }
    
    
}



