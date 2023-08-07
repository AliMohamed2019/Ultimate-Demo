//
//  Alert.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 08/08/2023.
//

import UIKit

class Alert {
    
    static func show(_ title: String = "Error", message: String, closeButtonTitle: String = "OK", context: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: closeButtonTitle, style: .cancel, handler: nil))
        
        context.present(alert, animated: true, completion: nil)
    }
    
}
