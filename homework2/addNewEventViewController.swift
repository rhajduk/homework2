//
//  addNewEventViewController.swift
//  homework2
//
//  Created by Rebecca Hajduk on 3/9/16.
//  Copyright © 2016 Rebecca Hajduk. All rights reserved.
//

import UIKit
import CoreData

class addNewEventViewController: UIViewController {
    
    //var newEvent: NSManagedObject!
    @IBOutlet weak var eventNameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var aboutField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func saveButton(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Event", inManagedObjectContext: managedContext)
        let newEvent = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        newEvent.setValue(eventNameField.text, forKey: "title")
        newEvent.setValue(locationField.text, forKey: "location")
        newEvent.setValue(aboutField.text, forKey: "about")
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        let dateString = dateFormatter.stringFromDate(datePicker.date)
        newEvent.setValue(dateString, forKey:("date"))
        //newEvent.setValue(datePicker.date, forKey: "date")
        
        do{
            try managedContext.save()
        }
        catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using
        // Pass the selected object to the new view controller.
    //}
    

}
