//
//  LoginViewController.swift
//  LoginForm
//
//  Created by vishalsonawane on 12/12/16.
//  Copyright © 2016 vishalsonawane. All rights reserved.
//

import UIKit

// MARK: RegEX Declaraions
let REGEX_EMAIL = "[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
let REGEX_PASSWORD_LIMIT = "^.{6,20}$"
let REGEX_PASSWORD = "[A-Za-z0-9]{6,20}"

class LoginViewController: UIViewController,UITextFieldDelegate{

    // MARK: Declarations
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var connectWithGoogleButton: UIButton!
    @IBOutlet weak var connectWithFBButton: UIButton!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTextField: TextFieldValidator!
    @IBOutlet  weak var emailTextField: TextFieldValidator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        backgroundView.addGradientWithColor(color: UIColor.blue)
        navigationController?.navigationBar.isHidden = true
        emailTextField.delegate = self
        
        emailTextField.addRegx(REGEX_EMAIL, withMsg: "Enter valid email.")
        passwordTextField.addRegx(REGEX_PASSWORD_LIMIT, withMsg: "Password length should be between 6-20")
      
        passwordTextField.addRegx(REGEX_PASSWORD, withMsg: "Password must be alpha numeric")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Button Actions
    @IBAction func signIn(_ sender: AnyObject) {
             print("Signing In..")
        print("Email text: \(emailTextField.text!)")
        
        self.view.endEditing(true)
        
        if(emailTextField.validate() && passwordTextField.validate())
        {
            print("everything is ok")
        }else{
            print("Something is wrong")
        }
        
    }
    
    @IBAction func forgotPassword(_ sender: AnyObject) {
    }

    //Handle your logic for siging with social media here
    @IBAction func connectWithFacebook(_ sender: AnyObject) {
        print("Signing In with facebook..")
    }
   
    @IBAction func connectWithGoogle(_ sender: AnyObject) {
        print("Signing In with Google..")
    }
        
}
