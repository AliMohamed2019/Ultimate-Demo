//
//  LoginViewModel.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import Foundation

class LoginViewModel {
    
    private(set) var driverName: String = ""
    private(set) var driverNo: String = ""
    private var password: String = ""
    var isLoading: Observable<Bool> = Observable(false)
    
    func login(completion: @escaping (_ error: String?) -> Void) {
        isLoading.value = true
        APICaller.perfromLogin(deleveryNo: driverNo, password: password) { [weak self] result in
            self?.isLoading.value = false
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    print(data)
                    if data.result?.errorNumber != 0, let error = data.result?.errorMessage {
                        completion(error)
                        return
                    }
                    if let driverName = data.data?.deliveryName {
                        self?.driverName = driverName
                        completion(nil)
                    }
                    
                case .failure(let error):
                    completion(error.localizedDescription)
                    print(error)
                }
            }
        }
    }
    
    // Setters
    func setDriverNo(driverNo: String) {
        self.driverNo = driverNo
    }
    
    func setPassword(password: String) {
        self.password = password
    }
}
