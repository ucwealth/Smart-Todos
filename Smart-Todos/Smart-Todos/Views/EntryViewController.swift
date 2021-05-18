//
//  EntryViewController.swift
//  Smart-Todos
//  Created by apple on 17/05/2021.
import UIKit
class EntryViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var field: UITextField!
    //    @IBOutlet var textViewField: UITextView!
    var update: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTodo))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTodo()
        return true
    }
    @objc func saveTodo() {
        guard let text = field.text, !text.isEmpty else {
            return
        }
        guard let  count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "todo_\(newCount)")
        update?()
        navigationController?.popViewController(animated: true)
    }
}
