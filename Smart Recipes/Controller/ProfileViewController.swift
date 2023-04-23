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
    
    @IBAction func didPressDeleteButton(_ sender: Any) {
        let alert = UIAlertController(title: "Warning!",
                                      message: "Are you sure you want to delete your account?",
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "No",
                                      style: UIAlertAction.Style.cancel,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Yes",
                                      style: UIAlertAction.Style.destructive,
                                      handler: { action in
            self.deleteAccount()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getUserData() {
        Task {
            guard let token = KeychainManager.getToken() else { return }
            guard let userData = try? await UserManager().userData(auth: token) else { return }
            
            populateFields(user: userData)
        }
    }
    
    private func deleteAccount() {
        Task {
            guard let token = KeychainManager.getToken() else { return }
            guard let status = try? await UserManager().delete(auth: token) else { return }
            
            if status {
                KeychainManager.removeToken()
                
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewControlle = storyBoard.instantiateViewController(withIdentifier: "Login") as! LogInViewController
                loginViewControlle.modalPresentationStyle = .fullScreen
                self.present(loginViewControlle, animated: true)
            }
        }
    }
    
    private func populateFields(user: User) {
        userNameLabel.text = user.firstname + " " + user.lastname
        emailLabel.text = user.email
    }
    
}
