//
//  DeliveryBillItemsResponse.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import Foundation

// MARK: - DeliveryBillItemsResponse
struct DeliveryBillItemsResponse: Codable {
    let data: DeliveryBillItems?
    let result: RquestResult?
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case result = "Result"
    }
}

// MARK: - DataClass
struct DeliveryBillItems: Codable {
    let deliveryBills: [DeliveryBill]?
    
    enum CodingKeys: String, CodingKey {
        case deliveryBills = "DeliveryBills"
    }
}

