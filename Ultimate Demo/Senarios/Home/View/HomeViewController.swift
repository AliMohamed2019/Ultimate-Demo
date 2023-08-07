//
//  HomeViewController.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var headerContainrView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentedControlContainrView: UIView!
    @IBOutlet weak var ordersTableView: UITableView!
    
    // MARK: - Variables
    private let cellId = "HomeOrderTableViewCell"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView()
    }
    
    // MARK: - IBActions
    
    
    // MARK: - Methods
    func setupUI() {
        // Header View Corner Raius
        headerContainrView.layer.cornerRadius = 16
        headerContainrView.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        // Add Shadow To Segmented Control
        segmentedControlContainrView.layer.cornerRadius = segmentedControlContainrView.frame.size.height/2
        segmentedControlContainrView.layer.shadowRadius = 3
        segmentedControlContainrView.layer.shadowColor = UIColor.customGray.cgColor
        segmentedControlContainrView.layer.shadowOpacity = 0.4
        segmentedControlContainrView.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func configureTableView() {
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        
        ordersTableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
}
