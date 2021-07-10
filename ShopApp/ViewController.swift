//
//  ViewController.swift
//  ShopApp
//
//  Created by Oluwabusayo Olorunnipa on 7/10/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startNewList))
        
    }


    
    @objc func startNewList() {
        shoppingList = [String]()
        tableView.reloadData()
        
    }
    
    @objc func addProduct() {
        let ac = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default){_ in
            guard let answer = ac.textFields?[0].text else {  return }
            self.submit(answer) // handler is replaced by closuree
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        shoppingList.insert(lowerAnswer, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        print(shoppingList)
        
    }


}

