//
//  LoginModel.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import Foundation

// MARK: - GetMobileSteps
struct LoginModel: Codable {
    let data: LoginData?
    let result: RquestResult?

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case result = "Result"
    }
}

// MARK: - LoginData
struct LoginData: Codable {
    let deliveryName: String?

    enum CodingKeys: String, CodingKey {
        case deliveryName = "DeliveryName"
    }
}

// MARK: - RquestResult
struct RquestResult: Codable {
    let errorMessage: String?
    let errorNumber: Int?

    enum CodingKeys: String, CodingKey {
        case errorMessage = "ErrMsg"
        case errorNumber = "ErrNo"
    }
}
