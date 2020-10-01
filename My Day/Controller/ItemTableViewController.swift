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
    
   let cellSpacingHeight: CGFloat = 10
    var itemArray = [String]()
    var textField = UITextField()
    var  done = 1.0
    var notDone = 1.0
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.rowHeight = 50.0
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           
           if editingStyle == .delete {
               
               // remove the item from the data model
               itemArray.remove(at: indexPath.row)
               
               // delete the table view row
               tableView.deleteRows(at: [indexPath], with: .fade)
               
           } else if editingStyle == .insert {
               // Not used in our example, but if you were adding a new row, this is where you would do it.
           }
       }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellItem = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
       // test = itemArray[indexPath.row]
        cellItem.textLabel?.text = itemArray[indexPath.row]
        let imageView: UIImageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
          imageView.image = UIImage(named: "note 2")
         imageView.contentMode = .scaleAspectFit
        //cellItem.accessoryView = imageView
       // cellItem.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
        cellItem.textLabel?.textAlignment = NSTextAlignment.center
        cellItem.textLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
        cellItem.textLabel?.textColor = .brown
       
        
        return cellItem
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
              if let cell = tableView.cellForRow(at: indexPath) {
                  if cell.accessoryType == .checkmark
                 {
                  cell.accessoryType = .none
                    notDone = notDone + 1.0
                    print(notDone)
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
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //doSomethingWithItem(indexPath.row)
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
    
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        print(itemArray[0])
    }
}
