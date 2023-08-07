//
//  LoginViewController.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    init() {
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var userIdTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Variables
    private let viewModel = LoginViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        observeIsLoading()
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        login()
    }
    
    // MARK: - Methods
    private func setupUI() {
        // Round Corner Radius
        userIdTF.layer.cornerRadius = userIdTF.frame.size.height/2
        passwordTF.layer.cornerRadius = passwordTF.frame.size.height/2
        loginButton.layer.cornerRadius = loginButton.frame.size.height/2
        
        // Change TextFields Placeholder Color
        userIdTF.attributedPlaceholder = NSAttributedString(string: "User ID",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTF.attributedPlaceholder = NSAttributedString(string: "Password",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
        // Assign TextField Delegate
        userIdTF.delegate = self
        passwordTF.delegate = self
    }
    
    /// Perfrom Login
    private func login() {
        viewModel.login { [weak self] error in
            if let error = error {
                print(error)
                return
            }
            self?.showHomeVC()
        }
    }
    
    /// Create and Present Homew ViewController
    private func showHomeVC() {
        let homeViewModel = HomeViewModel(deliveryNo: viewModel.driverNo, deliveryName: viewModel.driverName)
        let homeVC = HomeViewController(viewModel: homeViewModel)
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.modalPresentationStyle = .fullScreen
        present(homeNav, animated: true)
    }
    
    
    /// Observe view model isLoading
    private func observeIsLoading() {
        viewModel.isLoading.bind { [unowned self] isLoading in
            if isLoading {
                startLoading()
            } else {
                stopLoading()
            }
        }
    }
}

// MARK: - TextField Delegate
extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newValue = textField.text ?? ""
        
        // Usulay i if am not using RxSwift i create newValue like below but since there is a bug causing shouldChangeCharactersIn  method to trigger twice am using the above line
        
        // let newValue = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case userIdTF:
            viewModel.setDriverNo(driverNo: newValue)
        case passwordTF:
            viewModel.setPassword(password: newValue)
        default:
            break
        }
        
        return true
    }
}
