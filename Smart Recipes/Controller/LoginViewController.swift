//
//  LoginViewController.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 19.03.2023.
//

import UIKit

let kWelcomeMessage = "Welcome to Smart Recipes!"
let kSignupMessage = "Don't have an account?"

class LoginViewController: UIViewController {

    @IBOutlet weak var appLogoImageView: UIImageView!
    @IBOutlet weak var loginViewTitle: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabels()
    }


    private func setupLabels() {
        loginViewTitle.text = kWelcomeMessage
        signupMessageLabel.text = kSignupMessage
    }

}
