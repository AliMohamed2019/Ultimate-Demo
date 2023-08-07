//
//  HomeViewModel.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import Foundation

class HomeViewModel {
    
    private let deliveryNo: String
    let deliveryName: String
    
    init(deliveryNo: String, deliveryName: String) {
        self.deliveryNo = deliveryNo
        self.deliveryName = deliveryName
    }
    
    var isLoading: Observable<Bool> = Observable(false)
    private var orders = [DeliveryOrderViewModel]()
    private var currentSelectedSegment: Int = 0

    var cellCount: Int {
        return orders.count
    }
    
    private let orderDatabase = OrdersDatabase()
    
    /// Fetch Delivery Bills Items
    /// - Parameter completion: Completions With String Error
    func fetchOrders(completion: @escaping (_ error: String?) -> Void) {
        isLoading.value = true
        APICaller.fetchOrders(driverId: deliveryNo) { [weak self] result in
            self?.isLoading.value = false
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    print(data)
                    if data.result?.errorNumber != 0, let error = data.result?.errorMessage {
                        completion(error)
                        return
                    }
                    if let orders = data.data?.deliveryBills {
                        self?.saveOrdersToDB(orders: orders)
                        completion(nil)
                    }
                    
                case .failure(let error):
                    completion(error.localizedDescription)
                    print(error)
                }
            }
        }
    }
    
    func saveOrdersToDB(orders: [DeliveryBill]) {
        orderDatabase.insertOrders(orders: orders)
    }
    
    func filterDatabaseOrders() {
        orders = orderDatabase.filterOrder(isNew: currentSelectedSegment == 0)
    }
    
    func setSelectedSegment(index: Int) {
        currentSelectedSegment = index
    }
    
    func orderForCell(at indexPath: IndexPath) -> DeliveryOrderViewModel {
        return orders[indexPath.row]
    }
}
