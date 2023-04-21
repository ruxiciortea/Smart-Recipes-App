//
//  LoginViewController.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 19.03.2023.
//

import UIKit

let kWelcomeMessage = "Welcome to Smart Recipes!"
let kSignupMessage = "Don't have an account?"

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var appLogoImageView: UIImageView!
    @IBOutlet weak var loginViewTitle: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
        setupLabels()
    }

    @IBAction func didPRessLoginButton(_ sender: Any) {
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""

        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
          return
        }
        
        loginUser(email: email, password: password)
    }

    private func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setupLabels() {
        loginViewTitle.text = kWelcomeMessage
        signupMessageLabel.text = kSignupMessage
    }
    
    private func loginUser(email: String, password: String) {
        Task {
            guard let token = try? await UserManager().login(email: email, password: password) else {
                print("Failed")
                return
            }
            
            print(token.token)
            let successLogin = KeychainManager.saveToken(token: token)
            
            if successLogin {
                performSegue(withIdentifier: "ShowApp", sender: nil)
            }
        }
    }

}
