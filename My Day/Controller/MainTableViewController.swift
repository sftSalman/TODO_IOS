//
//  MainViewController.swift
//  My Day
//
//  Created by Salman Farshi on 12/8/20.
//  Copyright © 2020 Salman Farshi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    var  resultItem = 0
    var textF = UITextField()
    var taskArray = ["Study","Study","Study","Study","Study","Study"]
    let cellSpacingHeight: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100.0
       
      
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resultItem = taskArray.count
        return taskArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        //cell.textLabel?.text =  taskArray[indexPath.row]
       // taskArray.append(textF.text!)
        let contact = taskArray[indexPath.row]
        //cell.textLabel?.text = c
          // cell.yourTimeLabel?.text = (contact.value(forKey:"keyforDate") as? Date).getTimeStamp()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let stringDate = formatter.string(from: date)
        cell.textLabel?.text = contact
        
        
        
              // add border and color
      //  let color = UIColor(red: 0xF8, green: 0x7C, blue: 0x18)
        let color2 = UIColor(rgb: 0xfffcf7 )
              cell.backgroundColor = color2
             // cell.layer.borderColor = color2
        cell.layer.borderWidth = 0.1
        cell.layer.cornerRadius = 0
        
      let imageView: UIImageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
      imageView.image = UIImage(named: "note 2")
      imageView.contentMode = .scaleAspectFit
      cell.accessoryView = imageView
        
//
//       cell.clipsToBounds = true
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25.0)
        cell.textLabel?.textAlignment = NSTextAlignment.center
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        let ItemVc = storyboard?.instantiateViewController(identifier: "Item") as! ItemTableViewController
        ItemVc.title = taskArray[indexPath.row]
        ItemVc.itemArray = taskArray
        
        navigationController?.pushViewController(ItemVc, animated: true)
        
        
        
        
        
        
        
        
        
        
        
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            // remove the item from the data model
            taskArray.remove(at: indexPath.row)

            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)

        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return cellSpacingHeight
       }
    // Make the background color show through
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
        
    
    @IBAction func AddItemPressed(_ sender: UIBarButtonItem) {
   let alertController = UIAlertController(title: "Add New Items", message: "", preferredStyle: .alert)

 

   let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
   // self.textF = alertController.textFields![0] as UITextField
    

    self.taskArray.append(self.textF.text!)
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
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
//extension Date {
//    func getFormattedDate(format: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format
//        let strDate = dateFormatter.string(from: self)
//        return strDate
//    }
//
//    func getTimeStamp() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "hh:mm a"
//        let dateString = dateFormatter.string(from: self)
//        return dateString
//    }
//}
