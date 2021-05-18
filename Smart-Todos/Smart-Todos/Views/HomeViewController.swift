//  ViewController.swift
//  Smart-Todos
//  Created by Decagon on 17/05/2021.
import UIKit
class HomeViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var todos = [String]()
    var specificTodo = "here"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Todos"
        tableView.delegate = self
        tableView.dataSource = self
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        // get all current saved task
        updateTodos()
        print(specificTodo)
    }
    func save(){
        UserDefaults.standard.set(todos,  forKey: "notes")
    }
    func updateTodos() {
        todos.removeAll()
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        for each in 0..<count {
            if let todo = UserDefaults().value(forKey: "todo_\(each+1)") as? String {
                todos.append(todo)
            }
        }
        tableView.reloadData()
    }
    @IBAction func didTapAdd() {
        guard let viewCon = (storyboard?.instantiateViewController(identifier: "entry"))
                as? EntryViewController else { return }
        viewCon.title = "New ToDo"
        viewCon.update = {
            DispatchQueue.main.async {
                self.updateTodos()
            }
        }
        navigationController?.pushViewController(viewCon, animated: true)
    }
    // Swipe to delete table row
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                  forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(UserDefaults())
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewCon = storyboard?.instantiateViewController(identifier: "todo")
                as? TodoViewController else { return }
        viewCon.title = "New ToDo"
        viewCon.todo = todos[indexPath.row]
        specificTodo = viewCon.todo ?? ""
        print(specificTodo)
        navigationController?.pushViewController(viewCon, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
}
