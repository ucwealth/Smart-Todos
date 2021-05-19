//
//  EntryViewController.swift
//  Smart-Todos
//  Created by apple on 17/05/2021

import UIKit
class EntryViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var inputField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9523807564, green: 0.8469814127, blue: 0.5637647079, alpha: 1)
        inputField.delegate = self
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTodo))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTodo()
        return true
    }
    @objc func saveTodo() {
        if (inputField.text != nil) && inputField.text != "" {
            todoList?.append(inputField.text!)
        }
        navigationController?.popViewController(animated: true)
    }
}
