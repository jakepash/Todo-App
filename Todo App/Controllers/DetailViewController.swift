//
//  DetailViewController.swift
//  Todo App
//
//  Created by Jacob Pashman on 7/6/18.
//  Copyright © 2018 jacobpashman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var task: Task?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if let task = task {
            titleTextField.text = task.title
            descriptionTextField.text = task.description
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
   
     @IBAction func doneButtonTapped(_ sender: Any) {
        
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destination = segue.destination as? TableViewController
            else { return }
        
        
        switch identifier {
        // 2
        case "Done" where task != nil:
            task?.title = titleTextField.text ?? ""
            task?.description = descriptionTextField.text ?? ""
            task?.setTime()
            
            print("Done selected")
        case "Done" where task == nil:
            let task = Task(title: titleTextField.text!, description: descriptionTextField.text!)
            //task?.setTime()
            
            destination.toDoTasks.append(task)
            
            
            print("Done selected")
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
     // MARK: - Navigation
    
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
