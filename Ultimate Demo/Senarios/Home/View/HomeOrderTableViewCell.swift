//
//  HomeOrderTableViewCell.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit

class HomeOrderTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusColorView: UIView!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Methods
    private func setupUI() {
        statusColorView.layer.cornerRadius = 8
        statusColorView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowColor = UIColor.customGray.cgColor
        containerView.layer.shadowOpacity = 0.8
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
    }

}
