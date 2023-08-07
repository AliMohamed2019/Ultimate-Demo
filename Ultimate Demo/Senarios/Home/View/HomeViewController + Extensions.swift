//
//  HomeViewController + Extensions.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit

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
