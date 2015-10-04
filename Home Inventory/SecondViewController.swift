//
//  SecondViewController.swift
//  Home Inventory
//
//  Created by Jason Shultz on 10/2/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    
    @IBOutlet weak var fNameLabel: UILabel!
    
    @IBOutlet weak var lNameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var zipLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Profile")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if (results.count > 0) {
                
                for result in results as! [NSManagedObject] {
                    if let fname:String = result.valueForKey("fName") as? String { // cast username as String so we can use it.
                        fNameLabel.text = String(UTF8String: fname)!
                    } else {
                        fNameLabel.text = ""
                    }
                    if let lname = result.valueForKey("lName") as? String { // cast username as String so we can use it.
                        lNameLabel.text = String(lname)
                    } else {
                        lNameLabel.text = ""
                    }
                    if let address = result.valueForKey("address") as? String { // cast username as String so we can use it.
                        addressLabel.text = String(address)
                    } else {
                        addressLabel.text = ""
                    }
                    if let city = result.valueForKey("city") as? String { // cast username as String so we can use it.
                        cityLabel.text = String(city)
                    } else {
                        cityLabel.text = ""
                    }
                    if let state = result.valueForKey("state") as? String { // cast username as String so we can use it.
                        stateLabel.text = String(state)
                    } else {
                        stateLabel.text = ""
                    }
                    if let zip = result.valueForKey("zip") as? String { // cast username as String so we can use it.
                        print(zip)
//                        zipLabel.text = "bling"
                        zipLabel.text = zip
                    } else {
                        zipLabel.text = ""
                    }
                }
                
            }
        } catch {
            print("something went wrong")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

