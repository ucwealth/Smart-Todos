//
//  ViewController.swift
//  Smart-Todos
//
//  Created by Decagon on 17/05/2021.

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var todos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Todos"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // set up
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
      
        // get all current saved task
        updateTodos()
     
    }
    
    func updateTodos() {
        todos.removeAll()
        guard let  count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for i in 0..<count {
            if let todo = UserDefaults().value(forKey: "task_\(i+1)") as? String {
                todos.append(todo)
            }
        }
        
        tableView.reloadData()
    }
    
    
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(identifier: "entry")as! EntryViewController
        vc.title = "New ToDo"
        vc.update = {
            DispatchQueue.main.async{
                self.updateTodos()
            }
                
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension HomeViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "todo")as! TodoViewController
        vc.title = "New ToDo"
        vc.todo = todos[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
    
    //Swipe to delete table row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            todos.insert("todo", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .fade)
        }
    }
}

