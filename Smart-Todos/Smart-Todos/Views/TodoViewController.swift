//  TodoViewController.swift
//  Smart-Todos
//  Created by Decagon on 17/05/2021.
import UIKit

class TodoViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var textViewField: UITextView!
    var todo: String?
    var selectedItem: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9160798613, green: 0.8159586233, blue: 0.5499027492, alpha: 1)
//        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9160798613, green: 0.8159586233, blue: 0.5499027492, alpha: 1)
        textViewField.delegate = self
        textViewField.text = todo
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        // remove list
        todoList?.remove(at: selectedItem!)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        // insert item
        todoList?.insert(textViewField.text, at: selectedItem!)
    }
}
