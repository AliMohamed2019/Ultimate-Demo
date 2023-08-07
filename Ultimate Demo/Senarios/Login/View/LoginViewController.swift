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
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.modalPresentationStyle = .fullScreen
        present(homeNav, animated: true)
    }
    
    // MARK: - Methods
    func setupUI() {
        // Round Corner Radius
        userIdTF.layer.cornerRadius = userIdTF.frame.size.height/2
        passwordTF.layer.cornerRadius = passwordTF.frame.size.height/2
        loginButton.layer.cornerRadius = loginButton.frame.size.height/2
        
        // Change TextFields Placeholder Color
        userIdTF.attributedPlaceholder = NSAttributedString(string: "User ID",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTF.attributedPlaceholder = NSAttributedString(string: "Password",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
}
