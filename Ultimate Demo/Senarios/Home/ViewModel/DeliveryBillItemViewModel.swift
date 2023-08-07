//
//  DeliveryBillItemViewModel.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import Foundation
import SQLite

struct DeliveryOrderViewModel {
    
    let billSrl: String
    let billNo: String
    let billTotal: String
    let billDate: String
    let billType: String
    let statusType: OrderStatusType
    
    init(billSrl: String, billNo: String, billAmount: String, taxAmount: String, billDate: String, billType: String, delieveryStatusFlag: String) {
        
        // Set Properties
        self.billSrl = billSrl
        self.billNo = "#\(billNo)"
        self.billDate = billDate
        self.billType = billType
        
        // Calculate Total Amount
        let doubleBillAmount = Double(billAmount) ?? 0
        let doubleTaxAmount = Double(taxAmount) ?? 0
        let totalAmount = doubleBillAmount + doubleTaxAmount
        let finalTotalAmount = Int(totalAmount.rounded(.toNearestOrEven))
        billTotal = "\(finalTotalAmount) LE"
        
        // Set Status Type
        switch delieveryStatusFlag {
        case "0":
            statusType = .new
        case "1":
            statusType = .delivered
        case "2":
            statusType = .partialReturn
        case "3":
            statusType = .fullReturn
        default:
            statusType = .new
        }
        
    }
    
    /// Order Status Types Enum with Title And Color For Each Case
    enum OrderStatusType {
        case new
        case delivered
        case partialReturn
        case fullReturn
        
        var title: String {
            switch self {
            case .new:
                return "New"
            case .delivered:
                return "Delivered"
            case .partialReturn:
                return "Partial"
            case .fullReturn:
                return " Full Return"
            }
        }
        
        var color: UIColor {
            switch self {
            case .new:
                return .customGreen
            case .delivered:
                return .customDarkBlue
            case .partialReturn:
                return .customDarkGray
            case .fullReturn:
                return .customRed
            }
        }
    }
}
