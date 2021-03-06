//
//  EditProfileSwiftController.swift
//  Home Inventory
//
//  Created by Jason Shultz on 10/3/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit
import CoreData

class EditProfileSwiftController: UIViewController {
    
    
    @IBOutlet weak var firstNameField: UITextField!
    
    
    @IBOutlet weak var lastNameField: UITextField!
    
    
    @IBOutlet weak var streetAddressField: UITextField!
    
    
    @IBOutlet weak var cityField: UITextField!
    
    
    @IBOutlet weak var stateField: UITextField!
    
    
    @IBOutlet weak var zipField: UITextField!
    
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
                        firstNameField.text = String(UTF8String: fname)!
                    } else {
                        firstNameField.text = ""
                    }
                    if let lname = result.valueForKey("lName") as? String { // cast username as String so we can use it.
                        lastNameField.text = String(lname)
                    } else {
                        lastNameField.text = ""
                    }
                    if let address = result.valueForKey("address") as? String { // cast username as String so we can use it.
                        streetAddressField.text = String(address)
                    } else {
                        streetAddressField.text = ""
                    }
                    if let city = result.valueForKey("city") as? String { // cast username as String so we can use it.
                        cityField.text = String(city)
                    } else {
                        cityField.text = ""
                    }
                    if let state = result.valueForKey("state") as? String { // cast username as String so we can use it.
                        stateField.text = String(state)
                    } else {
                        stateField.text = ""
                    }
                    if let zip = result.valueForKey("zip") as? String { // cast username as String so we can use it.
                        zipField.text = String(zip)
                    } else {
                        zipField.text = ""
                    }
                }
                
            }
        } catch {
            print("something went wrong")
        }
        
    }
    
    @IBAction func profileButton(sender: AnyObject) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Profile")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if (results.count > 0) {
                
                for result in results as! [NSManagedObject] {
                    if let fname:String = result.valueForKey("fName") as? String { // cast username as String so we can use it.
                        result.setValue(String(firstNameField.text!), forKey: "fName")
                    }
                    if let lname = result.valueForKey("lName") as? String { // cast username as String so we can use it.
                        result.setValue(String(lastNameField.text!), forKey: "lName")
                    }
                    if let address = result.valueForKey("address") as? String { // cast username as String so we can use it.
                        result.setValue(String(streetAddressField.text!), forKey: "address")
                    }
                    if let city = result.valueForKey("city") as? String { // cast username as String so we can use it.
                        result.setValue(String(cityField.text!), forKey: "city")
                    }
                    if let state = result.valueForKey("state") as? String { // cast username as String so we can use it.
                        result.setValue(String(stateField.text!), forKey: "state")
                    }
                    if let zip = result.valueForKey("zip") as? String { // cast username as String so we can use it.
                        result.setValue(String(zipField.text!), forKey: "zip")
                    }
                }
                
                do {
                    try context.save()
                } catch {
                    print("something went wroing")
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