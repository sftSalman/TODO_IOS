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

    var itemArray = [""]
    var textF = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellItem = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
//        cellItem.textLabel?.text = itemArray[indexPath.row]
//        return cellItem
//    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


    @IBAction func itemBarPressed(_ sender: UIBarButtonItem) {



        let alertController = UIAlertController(title: "Add New Items", message: "", preferredStyle: .alert)



          let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
           self.itemArray.append(self.textF.text!)
           self.tableView.reloadData()

          })

          let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )

          alertController.addTextField { (alerTextField : UITextField!) -> Void in

           alerTextField.placeholder = "Enter New Items"
           self.textF = alerTextField
          }

          alertController.addAction(saveAction)
          alertController.addAction(cancelAction)

          self.present(alertController, animated: true, completion: nil)

    }

}
