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
    
    static func perfromLogin(deleveryNo: String, password: String, completion: @escaping (Result<LoginModel, Error>) -> Void) {
        guard let url = URL(string: NetworkConstants.shared.loginAddress) else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        let requestBody: [String: Any] = [
            constants.value : [
                constants.langNo : "2",
                constants.deliveryNo : deleveryNo,
                constants.password : password
            ]
        ]
        
        let bodyData = try? JSONSerialization.data(withJSONObject: requestBody)
        DispatchQueue.global().async {
            networkLayer.performRequest(from: url, with: bodyData, method: "POST", completion: completion)
        }
    }
    
    static func fetchOrders(deleveryNo: String, completion: @escaping (Result<DeliveryBillItemsResponse, Error>) -> Void) {
        guard let url = URL(string: NetworkConstants.shared.ordersAddress) else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        let requestBody: [String: Any] = [
            constants.value : [
                constants.langNo : "2",
                constants.deliveryNo : deleveryNo,
            ]
        ]
        
        let bodyData = try? JSONSerialization.data(withJSONObject: requestBody)
        DispatchQueue.global().async {
            networkLayer.performRequest(from: url, with: bodyData, method: "POST", completion: completion)
        }
    }
    
    
}
