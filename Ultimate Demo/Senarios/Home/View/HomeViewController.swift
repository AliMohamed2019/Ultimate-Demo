//
//  HomeViewController.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
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
        getOrders()
        observeIsLoading()
        addTapGestureRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Start New Idle Timer
        IdleTimer.shared.startTimer()
    }
    
    // MARK: - IBActions
    @IBAction func segmentedControllChanged(_ sender: UISegmentedControl) {
        viewModel.setSelectedSegment(index: sender.selectedSegmentIndex)
        reloadTableViewData()
    }
    
    // MARK: - Methods
    private func setupUI() {
        // Header View Corner Raius
        headerContainrView.layer.cornerRadius = 16
        headerContainrView.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        // Add Shadow To Segmented Control
        segmentedControlContainrView.layer.cornerRadius = segmentedControlContainrView.frame.size.height/2
        segmentedControlContainrView.layer.shadowRadius = 3
        segmentedControlContainrView.layer.shadowColor = UIColor.customGray.cgColor
        segmentedControlContainrView.layer.shadowOpacity = 0.4
        segmentedControlContainrView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        // Set User Name
        userNameLabel.text = viewModel.deliveryName
    }
    
    /// Register Table View Cell and assign delegate and data source
    private func configureTableView() {
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        ordersTableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        ordersTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 50, right: 0)
    }
    
    /// ViewModel fetch orders
    private func getOrders() {
        viewModel.fetchOrders { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                Alert.show(message: error, context: self)
                return
            }
            self.reloadTableViewData()
        }
    }
    
    /// Observe when view model is loading to show or hide activity indicator
    private func observeIsLoading() {
        viewModel.isLoading.bind { [unowned self] isLoading in
            if isLoading {
                startLoading()
            } else {
                stopLoading()
            }
        }
    }
    
    /// Reload Tableview and Data With Animation
    func reloadTableViewData() {
        // Remove Empty Message if Exists
        ordersTableView.removeEmptyMessage()
        
        // View Model Filter Orders
        viewModel.filterDatabaseOrders()
        
        // Animate the view to disappear and reappear
        UIView.animate(withDuration: 0.25, delay: .zero, options: .curveEaseIn) { [weak self] in
            self?.ordersTableView.alpha = 0.0
            
        } completion: { [weak self] _ in
            self?.ordersTableView.reloadData()
            UIView.animate(withDuration: 0.25, delay: .zero, options: .curveEaseOut) {
                self?.ordersTableView.alpha = 1.0
                
                // Show Empty Message If No Orders
                if self?.viewModel.cellCount == 0 {
                    self?.ordersTableView.showEmptyMessage(message: "No Orders Available!")
                }
            }
        }
        
    }
    
}
