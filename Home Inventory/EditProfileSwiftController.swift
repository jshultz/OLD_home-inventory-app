//
//  EditProfileSwiftController.swift
//  Home Inventory
//
//  Created by Jason Shultz on 10/3/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit

class EditProfileSwiftController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var firstNameField: UITextField!
    
    
    @IBOutlet weak var lastNameField: UITextField!
    
    
    @IBOutlet weak var streetAddressField: UITextField!
    
    
    @IBOutlet weak var cityField: UITextField!
    
    
    @IBOutlet weak var stateField: UITextField!
    
    
    @IBOutlet weak var zipField: UITextField!
    
    
    @IBAction func profileButton(sender: AnyObject) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}