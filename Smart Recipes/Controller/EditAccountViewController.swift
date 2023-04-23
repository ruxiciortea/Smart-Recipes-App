//
//  EditAccountViewController.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 23.04.2023.
//

import UIKit

class EditAccountViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var adminSwitch: UISwitch!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
    }
    
    @IBAction func didPressCreateButton(_ sender: Any) {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        let isAdmin = adminSwitch.isOn
        
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
          return
        }
        
        let role = isAdmin ? "ADMIN" : "USER"
        
        register(firstName: firstName,
                 lastName: lastName,
                 email: email,
                 role: role)
    }
    
    private func setDelegates() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
    }
    
    private func register(firstName: String,
                          lastName: String,
                          email: String,
                          role: String) {
        Task {
            guard let token = KeychainManager.getToken() else { return }
            guard let _ = try? await UserManager().update(auth: token,
                                                             firstName: firstName,
                                                             lastName: lastName,
                                                             email: email,
                                                             role: role) else {
                return
            }
            
            print(token.token)
            let successRegister = KeychainManager.saveToken(token: token)
            self.dismiss(animated: true)
        }
    }

}
