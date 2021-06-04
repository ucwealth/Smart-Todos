//
//  Store.swift
//  Smart-Todos
//
//  Created by Decagon on 18/05/2021.
//

import Foundation

var todoList: [String]?
func saveData(todoList: [String]) {
    UserDefaults.standard.set(todoList, forKey: "todoList")
}
func fetchData() -> [String]? {
    if let todo = UserDefaults.standard.array(forKey: "todoList") as? [String] {
        return todo
    } else {
        return nil
    }
}
