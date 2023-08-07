//
//  UIView.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 08/08/2023.
//

import UIKit

extension UIView {
    
    // Show Empty Message And Placeholder Image View
    func showEmptyMessage(message: String) {
        
        // Create Label
        let messageLabel = UILabel()
        messageLabel.tag = 999
        messageLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        messageLabel.textColor = .customDarkBlue
        messageLabel.text = message
        messageLabel.textAlignment = .center
        addSubview(messageLabel)
        
        // Label Constrain
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    // Remove Empty Message
    func removeEmptyMessage() {
        if let label = viewWithTag(999) {
            label.removeFromSuperview()
        }
    }
    
}

