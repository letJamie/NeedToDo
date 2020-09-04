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
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let todo = ToDoItem(context: context)
            
            if let name = nameTextField.text {
                
                todo.name = name
                todo.important = importantSwitch.isOn
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
