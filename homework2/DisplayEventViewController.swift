//
//  DisplayEventViewController.swift
//  homework2
//
//  Created by Rebecca Hajduk on 3/9/16.
//  Copyright © 2016 Rebecca Hajduk. All rights reserved.
//

import UIKit
import CoreData

class DisplayEventViewController: UIViewController {
    
    var currentEvent: NSManagedObject?

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    let dateFormatter = NSDateFormatter()
    
    @IBAction func deleteButton(sender: AnyObject) {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        context.delete(currentEvent)
        do {
           try context.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentEvent?.valueForKey("title") as! String?
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateLabel.text = currentEvent?.valueForKey("date")!.dateFormat as String?
        locationLabel.text = currentEvent?.valueForKey("location") as! String?
        aboutLabel.text = currentEvent?.valueForKey("about") as! String?
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
