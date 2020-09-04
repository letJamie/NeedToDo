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
    
    var todo: ToDoItem? = nil
        
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = todo?.name {
            
            mainLabel.text = name
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if todo != nil {
                context.delete(todo!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)

            }
        }
    }
}
