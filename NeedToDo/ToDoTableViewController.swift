//
//  ToDoTableViewController.swift
//  NeedToDo
//
//  Created by Jamie on 2020/09/03.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    
    var toDos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        let toDo1 = ToDo()
        toDo1.name = "Buy milk"
        toDo1.important = true
        
        let toDo2 = ToDo()
        toDo2.name = "Walk the dog"
        toDo2.important = false
        
        toDos = [toDo1, toDo2]
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            
            cell.textLabel?.text = "❗️" + toDo.name

            
        } else {
            cell.textLabel?.text = toDo.name

        }
        
        
        
        return cell
    }
    

}
