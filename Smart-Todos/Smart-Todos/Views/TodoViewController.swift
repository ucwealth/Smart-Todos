//  TodoViewController.swift
//  Smart-Todos
//  Created by Decagon on 17/05/2021.
import UIKit

class TodoViewController: UIViewController {
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var textViewField: UITextView!
    var todo: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        //        textViewField.delegate = self
        todoLabel.text = todo
        textViewField.text = "\(todo ?? " ") "
    }
    func textViewDidBeginEditing() {
        // remove
    }
    func textViewDidEndEditing() {
        // insert
    }
}
