//
//  AddViewController.swift
//  NeedToDo
//
//  Created by Jamie on 2020/09/03.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var toDoTableVC: ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
//        let name = nameTextField.text
//        let important = importantSwitch.isOn
//
        let todo = ToDo()
        
        if let name = nameTextField.text {
            
            todo.name = name
            todo.important = importantSwitch.isOn
            toDoTableVC?.toDos.append(todo)
            toDoTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
       
        
        

        
    }
    

}
