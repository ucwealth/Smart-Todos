//  TodoViewController.swift
//  Smart-Todos
//  Created by Decagon on 17/05/2021.
import UIKit

class TodoViewController: UIViewController {
    @IBOutlet var todoLabel: UILabel!
    var todo: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        todoLabel.text = todo
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleleItem))
    }
    @objc func deleleItem() {
        guard let  count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
//        UserDefaults.standard.removeObject(forKey: "\(indexPath.row)")
//        let currentPosition = 
        let newCount = count - 1
        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "todo_\(currentPosition)")
//        UserDefaults.standard.removeObject(forKey: indexPath.row)
    }
}
