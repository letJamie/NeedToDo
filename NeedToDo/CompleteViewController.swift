//
//  CompleteViewController.swift
//  NeedToDo
//
//  Created by Jamie on 2020/09/04.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var todo = ToDo()
    
    var toDoTableVC: ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        mainLabel.text = todo.name
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        
        if let toDos = toDoTableVC?.toDos {
            var index = 0
            for x in toDos {
                if x.name == todo.name {
                    toDoTableVC?.toDos.remove(at: index)
                    toDoTableVC?.tableView.reloadData()
                    navigationController?.popViewController(animated: true)
                    return
                }
                
                index += 1
            }
        }
        
    }
    
  
}
