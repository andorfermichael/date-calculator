//
//  ViewController.swift
//  Date Calculator
//
//  Created by Michael Andorfer on 08.10.15.
//  Copyright © 2015 FH Salzburg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.date = NSDate()
        datePickerValueChanged(datePicker);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var datePicker : UIDatePicker!
    @IBOutlet var kalenderWoche : UILabel!
    @IBOutlet var wochenTag : UILabel!
    @IBOutlet var differenzInTagen : UILabel!
    
    @IBAction func datePickerValueChanged(datePicker : UIDatePicker!) {
        
        // Calculate data from date picker data
        let datePickerDate = datePicker.date
        let currentDate = NSDate()
        let currentCalendar = NSCalendar.currentCalendar()
        var calendarWeek = currentCalendar.component(NSCalendarUnit.WeekOfYear, fromDate: datePickerDate)
        let weekDay = datePickerDate.weekdayName;
        let differenceInDays = abs(currentCalendar.components(.Day, fromDate: datePickerDate, toDate: currentDate, options: NSCalendarOptions.WrapComponents).day)
        
        // Create week day label text
        var weekDayStr = "Wochentag : \(weekDay)"
        
        // Change label to correct week day
        wochenTag.text = weekDayStr;
        
        // Correct calendar week from american to european format
        if weekDay == "Sunday" {
            calendarWeek = calendarWeek - 1;
        }
        
        // Create calendar week label text
        var calendarWeekStr = "Kalenderwoche : \(calendarWeek)"
        
        // Change label to correct calendar week
        kalenderWoche.text = calendarWeekStr
        
        // Create difference in days label text
        var differenceInDaysStr = "Differenz zu heute in Tagen: \(differenceInDays)"
        
        // Change label to correct calendar week
        differenzInTagen.text = differenceInDaysStr
        
        
    }
}

// Extension of NSDate which calculates weekday as string
extension NSDate {
    // returns weekday name (Sunday-Saturday) as String
    var weekdayName: String {
        let formatter = NSDateFormatter();
        formatter.dateFormat = "EEEE"
        return formatter.stringFromDate(self)
    }
}

