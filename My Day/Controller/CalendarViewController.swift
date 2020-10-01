//
//  CalendarViewController.swift
//  My Day
//
//  Created by Salman Farshi on 20/9/20.
//  Copyright © 2020 Salman Farshi. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController,FSCalendarDelegateAppearance,FSCalendarDataSource {
    
    var datesWithEvent = ["2015-10-03", "2015-10-06", "2015-10-12", "2015-10-25"]

    var datesWithMultipleEvents = ["2015-10-08", "2015-10-16", "2015-10-20", "2015-10-28"]
    @IBOutlet weak var cal: FSCalendar!
    var presentDatesArray = "2016-04-03"
        

    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
      //  title = "Calendar"
        
       // cal.setCurrentPage(dateFormatter2.date(from: presentDatesArray)!, animated: true)
        cal.select(dateFormatter2.date(from: presentDatesArray))
        
    
        
        
        
    }
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {

        let dateString = self.dateFormatter2.string(from: date)

        if self.datesWithEvent.contains(dateString) {
            return 1
        }

        if self.datesWithMultipleEvents.contains(dateString) {
            return 3
        }

        return 0
    }
    
    func calendar(calendar: FSCalendar!, appearance: FSCalendarAppearance!, titleDefaultColorForDate date: NSDate!) -> UIColor!
    {
       
        let dateString = presentDatesArray


        //if presentDatesArray.containsObject(dateString)
        if presentDatesArray.contains(dateString)
        {
            return UIColor.green
        }
       
        else
        {
            return nil
        }
    }

    

}
