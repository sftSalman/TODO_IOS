//
//  ItemTableViewController.swift
//  My Day
//
//  Created by Salman Farshi on 31/8/20.
//  Copyright © 2020 Salman Farshi. All rights reserved.
//
import UIKit
import Firebase

class ItemTableViewController: UITableViewController {

    var itemArray = [String]()
    var textField = UITextField()
    var  done = 1.0
    var notDone = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()

    }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellItem = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cellItem.textLabel?.text = itemArray[indexPath.row]
        return cellItem
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
              if let cell = tableView.cellForRow(at: indexPath) {
                  if cell.accessoryType == .checkmark
                 {
                  cell.accessoryType = .none
                    notDone = notDone + 1.0
                    print(notDone)
                 }
                 else
                 {
                  cell.accessoryType = .checkmark
                    done = done + 1.0
                    print(done)
                 }
             }
          

        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }


    @IBAction func itemBarPressed(_ sender: UIBarButtonItem) {



        let alertController = UIAlertController(title: "Add New Items", message: "", preferredStyle: .alert)



          let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
            
           self.itemArray.append(self.textField.text!)
           self.tableView.reloadData()

          }
        )

          let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )

          alertController.addTextField { (alerTextField : UITextField!) -> Void in

           alerTextField.placeholder = "Enter New Items"
           self.textField = alerTextField
          }

          alertController.addAction(saveAction)
          alertController.addAction(cancelAction)

          self.present(alertController, animated: true, completion: nil)

    }
    
}
