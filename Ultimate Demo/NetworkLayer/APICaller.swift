//
//  APICaller.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import Foundation

class APICaller {
    
    private static let networkLayer: NetworkLayerProtocol = NetworkLayer()
    private static let constants = NetworkConstants.shared
    
    /// Login API
    /// - Parameters:
    ///   - driverId: Driver Number
    ///   - password: Password
    ///   - completion: Completion with result eather LoginModel or Error
    static func perfromLogin(driverId: String, password: String, completion: @escaping (Result<LoginModel, Error>) -> Void) {
        // Create URL from url string
        guard let url = URL(string: NetworkConstants.shared.loginAddress) else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        // Create Body Data
        let requestBody: [String: Any] = [
            constants.value : [
                constants.langNo : "2",
                constants.deliveryNo : driverId,
                constants.password : password
            ]
        ]
        
        let bodyData = try? JSONSerialization.data(withJSONObject: requestBody)
        
        // Perform Request
        DispatchQueue.global().async {
            networkLayer.performRequest(from: url, with: bodyData, method: "POST", completion: completion)
        }
    }
    
    /// Retrieve Deliver Bill Items
    /// - Parameters:
    ///   - driverId: Driver Number
    ///   - completion: Completion with result eather DeliveryBillItemsResponse or Error
    static func fetchOrders(driverId: String, completion: @escaping (Result<DeliveryBillItemsResponse, Error>) -> Void) {
        // Create URL from url string
        guard let url = URL(string: NetworkConstants.shared.ordersAddress) else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        // Create Body Data
        let requestBody: [String: Any] = [
            constants.value : [
                constants.langNo : "2",
                constants.deliveryNo : driverId,
            ]
        ]
        
        let bodyData = try? JSONSerialization.data(withJSONObject: requestBody)
        
        // Perform Request
        DispatchQueue.global().async {
            networkLayer.performRequest(from: url, with: bodyData, method: "POST", completion: completion)
        }
    }
    
    
}
