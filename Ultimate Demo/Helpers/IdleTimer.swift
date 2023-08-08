//
//  IdleTimer.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 08/08/2023.
//

import UIKit

class IdleTimer {
    
    public static var shared = IdleTimer()
    
    private init() {
    }
    
    private var timer: Timer?
    private var idleTimeInSeconds: TimeInterval = 120
    
    /// Start Timer or Continue if already running
    public func startTimer() {
        guard timer?.isValid == false || timer == nil else { return }
        restartTimer()
    }
    
    /// Restart Timer And Time Interval
    public func restartTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: idleTimeInSeconds, target: self, selector: #selector(timerExpired), userInfo: nil, repeats: false)
    }
    
    /// Present Login On Timer Expire
    @objc private func timerExpired() {
        // Get Current Window
        let window = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        
        let loginVC = LoginViewController()
        
        // Check CurrentVC isn't LoginViewController
        if let topController = window?.rootViewController?.presentedViewController, topController != loginVC {
            // Present Login ViewController
            window?.rootViewController = loginVC
            window?.makeKeyAndVisible()
        }
    }
    
}
