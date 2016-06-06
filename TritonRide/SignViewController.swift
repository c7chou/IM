//
//  SignUpViewController.swift
//  TritonRide
//
//  Created by Jerry Chou on 6/5/16.
//  Copyright © 2016 UCSD. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtConfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@ucsd.edu"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    /*
    func didSignup(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("loginView") as NextViewController
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }*/
    // MARK: Signups
    @IBAction func signupTapped(sender: UIButton) {
        let username:String = txtUsername.text!
        let password:String = txtPassword.text!
        let confirmPassword:String = txtConfirmPassword.text!
        if ( username == "" || password == "" || confirmPassword == "" ) {
            let alertController:UIAlertController = UIAlertController(title: "Sign Up Failed",message: "Please enter Username and Password", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default , handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        } else if ( !(password == confirmPassword)) {
            let alertController:UIAlertController = UIAlertController(title: "Sign Up Failed",message: "Password does not match", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default , handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        } else if ( !isValidEmail(username)){
            let alertController:UIAlertController = UIAlertController(title: "Sign Up Failed",message: "Require a valid UCSD email address", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default , handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            let email = username
            let password = password
            FIRAuth.auth()?.createUserWithEmail(email, password: password) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                let successAlertController:UIAlertController = UIAlertController(title: "Sign Up Successfully", message: "Enjoy", preferredStyle: .Alert)
                successAlertController.addAction(UIAlertAction(title: "OK", style: .Default , handler: nil))
                self.presentViewController (successAlertController, animated: true, completion: nil)
            }
        }
    }
    
  
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController = LoginViewController
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 */
    

}