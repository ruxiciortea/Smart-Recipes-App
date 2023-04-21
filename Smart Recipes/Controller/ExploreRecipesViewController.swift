//
//  ExploreRecipesViewController.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 21.04.2023.
//

import UIKit

class ExploreRecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var allRecipesTableView: UITableView!
    
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allRecipesTableView.dataSource = self
        allRecipesTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getAllRecipes()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = recipe.title
        
        return cell
    }
    
    private func getAllRecipes() {
        Task {
            guard let token = KeychainManager.getToken() else { return }
            guard let allRecipes = try? await RecipesManager().getAll(auth: token) else { return }
            
            recipes = allRecipes
            allRecipesTableView.reloadData()
        }
    }

}
