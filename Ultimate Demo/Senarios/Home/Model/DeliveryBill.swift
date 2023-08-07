//
//  DeliveryBill.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 08/08/2023.
//

import Foundation

// MARK: - DeliveryBill
struct DeliveryBill: Codable {
    let billAmount, billDate: String?
    let billNo, billSrl, billType: String?
    let delieveryStatusFlag: String?
    let taxAmount: String?
    
    enum CodingKeys: String, CodingKey {
        case billAmount = "BILL_AMT"
        case billDate = "BILL_DATE"
        case billNo = "BILL_NO"
        case billSrl = "BILL_SRL"
        case billType = "BILL_TYPE"
        case delieveryStatusFlag = "DLVRY_STATUS_FLG"
        case taxAmount = "TAX_AMT"
    }
}
