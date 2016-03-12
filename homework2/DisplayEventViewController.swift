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
    var objectContext: NSManagedObjectContext?

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    
    @IBAction func deleteButton(sender: AnyObject) {
//        let appDelegate =
//        UIApplication.sharedApplication().delegate as! AppDelegate
//        let context = appDelegate.managedObjectContext
        self.objectContext!.deleteObject(currentEvent!)
        do {
           try objectContext!.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = currentEvent?.valueForKey("title") as! String?
        dateLabel.text = currentEvent?.valueForKey("date") as! String?
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
