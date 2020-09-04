//
//  ToDoTableViewController.swift
//  NeedToDo
//
//  Created by Jamie on 2020/09/03.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    
    var toDos: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let toDoItemInCoreData = try? context.fetch(ToDoItem.fetchRequest()) as [ToDoItem] {
                toDos = toDoItemInCoreData
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            if let name = toDo.name {
                cell.textLabel?.text = "❗️" + name
            }
        } else {
            cell.textLabel?.text = toDo.name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTodo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedTodo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let createVC = segue.destination as? AddViewController {
            createVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController {
            if let toDo = sender as? ToDo {
               
                completeVC.todo = toDo
                completeVC.toDoTableVC = self

            }
        }
    }
}
