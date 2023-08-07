//
//  UIViewController.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit
import ProgressHUD

extension UIViewController {
    
    /// Show Activity Indicator
    func startLoading() {
        ProgressHUD.animationType = .systemActivityIndicator
        ProgressHUD.colorAnimation = .customDarkBlue
        ProgressHUD.colorBackground = .black.withAlphaComponent(0.2)
        ProgressHUD.show(interaction: false)
    }
    
    /// Hide Activity Indicator
    func stopLoading() {
        ProgressHUD.dismiss()
    }
    
}
