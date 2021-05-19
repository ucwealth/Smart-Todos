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
