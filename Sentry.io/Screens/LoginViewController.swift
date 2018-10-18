//
//  LoginViewController.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 18/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let red = UIColor(red:1.00, green:0.25, blue:0.21, alpha:1.0)
    
    let tokenInputField: UITextField = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
    let welcomeLabel: UILabel = UILabel()
    let errorLabel: UILabel = UILabel()
    let loginButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupWelcomeLabel()
        setupTokenInputField()
        setupLoginButton()
    }
    
    @objc func loginOnCLick () {
        guard let token: String = tokenInputField.text else { return }
        UserDefaults.standard.set(token, forKey: "token")
        HTTPHandler.getProjectsJSON(token: token, completionHandler: validateUser)
    }
    
    func validateUser (_ data: Data?) -> Void {
        if data != nil{
            UserDefaults.standard.set(true, forKey: "loginStatus")
            UserDefaults.standard.set(data, forKey: "projects")
            Switcher.updateRootViewController()
        } else {
            DispatchQueue.main.async {
                self.setupErrorLabel()
            }
        }
    }
    
    
    // Setup UI functions
    func setupTokenInputField () {
        tokenInputField.placeholder = "enter token here"
        
        view.addSubview(tokenInputField)
        setupTokenInputFieldConstraints()
    }
    
    func setupWelcomeLabel () {
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = welcomeLabel.font.withSize(30)
        view.addSubview(welcomeLabel)
        setupWelcomeLabelConstraints()
    }
    
    func setupErrorLabel () {
        errorLabel.text = "Error with token"
        errorLabel.textColor = red
        errorLabel.font = welcomeLabel.font.withSize(20)
        view.addSubview(errorLabel)
        setupErrorLabelConstraints()
    }
    
    func setupLoginButton () {
        loginButton.backgroundColor = red
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        
        loginButton.addTarget(self, action: #selector(loginOnCLick), for: .touchUpInside)
        
        view.addSubview(loginButton)
        setupLoginButtonConstraints()
    }
    
    
    // UI Constraints
    func setupTokenInputFieldConstraints () {
        tokenInputField.translatesAutoresizingMaskIntoConstraints = false
        tokenInputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tokenInputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tokenInputField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tokenInputField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
    }
    
    func setupWelcomeLabelConstraints () {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        welcomeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
    }
    
    func setupErrorLabelConstraints () {
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
    }
    
    func setupLoginButtonConstraints () {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }

}
