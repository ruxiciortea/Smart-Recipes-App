//
//  ProfileViewController.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 20.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getUserData()
    }
    
    private func getUserData() {
        Task {
            guard let token = KeychainManager.getToken() else { return }
            guard let userData = try? await UserManager().userData(auth: token) else { return }
            
            populateFields(user: userData)
        }
    }
    
    private func populateFields(user: User) {
        userNameLabel.text = user.firstname + " " + user.lastname
        emailLabel.text = user.email
    }

}
