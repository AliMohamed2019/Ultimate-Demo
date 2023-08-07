//
//  HomeViewController + Extensions.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit

// MARK: - TableView Delegate & Data Source
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeOrderTableViewCell", for: indexPath) as! HomeOrderTableViewCell
        
        let order = viewModel.orderForCell(at: indexPath)
        cell.setCellOrder(order: order)
        
        return cell
    }
    
}

// MARK: - Tap Gesture Recognizer
extension HomeViewController: UIGestureRecognizerDelegate {
    
    /// Add Tap Gesture To Observe If User Is Tapping on Screen
    func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: nil)
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        IdleTimer.shared.restartTimer()
        return false
    }
}
