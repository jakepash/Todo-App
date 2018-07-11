//
//  TableViewController.swift
//  Todo App
//
//  Created by Jacob Pashman on 7/6/18.
//  Copyright © 2018 jacobpashman. All rights reserved.
//

import UIKit




class TableViewController: UITableViewController {

    var lastRowTapped: Int?

    var tasks = [[Task]]()
    var doneTasks = [Task]()
    var toDoTasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        //1self.tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0)
        
        tasks.append(toDoTasks)
        tasks.append(doneTasks)
        
        
        
    }

    @objc func checkboxValueChanged(sender: Checkbox) {
        print("checkbox value change: \(sender.isChecked)")
        
        switch sender.isChecked {
        case true:
            toDoTasks[sender.row!].completed = true
            doneTasks.append(toDoTasks[sender.row!])
            toDoTasks.remove(at: sender.row!)
        default:
            doneTasks[sender.row!].completed = false
            toDoTasks.append(doneTasks[sender.row!])
            doneTasks.remove(at: sender.row!)
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Todo"
        }
        return "Done"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return toDoTasks.count
        }
        return doneTasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseidentifer", for: indexPath) as! TableViewCell
        
        
//        if cell.checkBoxView.isChecked {
//            print("\(toDoTasks[indexPath.row].title)")
//            doneTasks.append(toDoTasks[indexPath.row])
//            toDoTasks.remove(at: indexPath.row)
//            tasks[0] = toDoTasks
//            tasks[1] = doneTasks
//        }
        if indexPath.section == 0 && toDoTasks.count > 0{
            
            print("todo tasks: \(toDoTasks)")
            print("done tasks: \(doneTasks)")
            print(indexPath.row)
            
            cell.titleLabel.text = toDoTasks[indexPath.row].title
            // let date = tasks[indexPath.row].lastEdited.toString(withFormat: "mm-dd-yyyy")
            cell.dateTitle.text = toDoTasks[indexPath.row].lastEdited
            cell.checkBoxView.checkmarkStyle = .tick
            cell.checkBoxView.useHapticFeedback = true
            cell.checkBoxView.borderStyle = .circle
            cell.checkBoxView.isChecked = false
        }
        else if indexPath.section == 1 && doneTasks.count > 0{
            
            print("todo tasks: \(toDoTasks)")
            print("done tasks: \(doneTasks)")
            print(indexPath.row)
            
            cell.titleLabel.text = doneTasks[indexPath.row].title
            // let date = tasks[indexPath.row].lastEdited.toString(withFormat: "mm-dd-yyyy")
            cell.dateTitle.text = doneTasks[indexPath.row].lastEdited
            cell.checkBoxView.checkmarkStyle = .tick
            cell.checkBoxView.useHapticFeedback = true
            cell.checkBoxView.borderStyle = .circle
            cell.checkBoxView.isChecked = true
        }
        // Configure the cell...
        
        
        cell.checkBoxView.addTarget(self, action: #selector(checkboxValueChanged(sender:)), for: .valueChanged)
        cell.checkBoxView.row = indexPath.row
        
        

        return cell
    }
    @IBAction func AddButtonPressed(_ sender: Any) {
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        switch identifier {
        case "Edit Task":
            print("new task cell tapped")
            // 1
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            // 2
            let task = toDoTasks[indexPath.row]
            // 3
            let destination = segue.destination as! DetailViewController
            // 4
            destination.task = task
        case "New Task":
            print("add task tapped")
        default:
            print("unidentified segue")
        }
    }
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row) selected")
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension Date {
    
    func toString(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let myString = formatter.string(from: self)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = format
        
        return formatter.string(from: yourDate!)
    }
}
