//
//  AccountFieldsViewController.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 20.04.2023.
//

import UIKit

class AccountFieldsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reenteredPasswordTextField: UITextField!
    @IBOutlet weak var adminSwitch: UISwitch!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
    }
    
    @IBAction func didPressCreateButton(_ sender: Any) {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let password1 = passwordTextField.text else { return }
        guard let password2 = reenteredPasswordTextField.text else { return }
        let isAdmin = adminSwitch.isOn
        
        if firstName.isEmpty || lastName.isEmpty ||
            email.isEmpty ||
            password1.isEmpty || password2.isEmpty {
          return
        }
        
        let role = isAdmin ? "ADMIN" : "USER"
        
        register(firstName: firstName,
                 lastName: lastName,
                 email: email,
                 password: password1,
                 reenteredPAssword: password2,
                 role: role)
    }
    
    private func setDelegates() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        reenteredPasswordTextField.delegate = self
    }
    
    private func register(firstName: String,
                          lastName: String,
                          email: String,
                          password: String,
                          reenteredPAssword: String,
                          role: String) {
        Task {
            guard let token = try? await UserManager().register(firstName: firstName,
                                                                lastName: lastName,
                                                                email: email,
                                                                password: password,
                                                                reenteredPAssword: reenteredPAssword,
                                                                role: role) else {
                return
            }
            
            print(token.token)
            let successRegister = KeychainManager.saveToken(token: token)
        }
    }

}
