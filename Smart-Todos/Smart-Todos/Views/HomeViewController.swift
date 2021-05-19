//  ViewController.swift
//  Smart-Todos
//  Created by Decagon on 17/05/2021.

import UIKit
class HomeViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var entryVC = EntryViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Todos"
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    @IBAction func addButtonTapped() {
        guard let viewCon = (storyboard?.instantiateViewController(identifier: "entry"))
                as? EntryViewController else { return }
        viewCon.title = "New ToDo"
        navigationController?.pushViewController(viewCon, animated: true)
    }
    // Swipe to delete table row
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                  forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewCon = storyboard?.instantiateViewController(identifier: "todo")
                as? TodoViewController else { return }
        viewCon.title = "New ToDo"
        viewCon.todo = todoList![indexPath.row]
        navigationController?.pushViewController(viewCon, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let todo = todoList {
            return todo.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        if let todo = todoList {
            cell.textLabel?.text = todo[indexPath.row]
        }
        return cell
    }
}
