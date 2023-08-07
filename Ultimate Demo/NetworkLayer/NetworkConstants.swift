//
//  NetworkConstants.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    private init() {
    }
    
    public let loginAddress: String = "http://mapp.yemensoft.net/OnyxDeliveryService/Service.svc/CheckDeliveryLogin"
    public let ordersAddress: String = "http://mapp.yemensoft.net/OnyxDeliveryService/Service.svc/GetDeliveryBillsItems"
    
    public let langNo: String = "P_LANG_NO"
    public let deliveryNo: String = "P_DLVRY_NO"
    public let password: String = "P_PSSWRD"
    public let value: String = "Value"

}
