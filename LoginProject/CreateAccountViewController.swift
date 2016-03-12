//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Ansel Adams on 3/12/16.
//  Copyright © 2016 Ansel Adams. All rights reserved.
//

import UIKit

// Delegate
protocol CreateAccountViewControllerDelegate {
    func accountCreated()
}

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var chooseUsernameTextField: UITextField!
    @IBOutlet weak var choosePasswordTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    
    // Delegate
    var delegate: CreateAccountViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountButtonPressed(sender: UIButton) {
        if choosePasswordTextfield.text == confirmPasswordTextfield.text && choosePasswordTextfield.text != nil {
            
            NSUserDefaults.standardUserDefaults().setObject(self.chooseUsernameTextField.text, forKey: kUserNameKey)
            NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextfield.text, forKey: kPasswordKey)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            // Delegate
            delegate?.accountCreated()  // callback
        }
    }

    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
