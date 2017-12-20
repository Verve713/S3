//
//  RegisterViewController.swift
//  Split Sheetz
//
//  Created by Verve on 11/22/17.
//  Copyright © 2017 Verve. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabaseUI

class RegisterViewController: UIViewController {
    var ref: DatabaseReference! = Database.database().reference()
    @IBOutlet weak var ErrorMessageLabel: UITextField!
    @IBOutlet weak var FirstNameTextField: UITextField! = nil
    @IBOutlet weak var LastNameTextField: UITextField! = nil
    @IBOutlet weak var EmailTextField: UITextField! = nil
    @IBOutlet weak var BirthDateTextField: UITextField! = nil
    @IBOutlet weak var UsernameTextField: UITextField! = nil
    @IBOutlet weak var PasswordTextField: UITextField! = nil
    @IBOutlet weak var ConfirmPasswordTextField: UITextField! = nil
    @IBOutlet weak var SubmitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FirebaseApp.configure()
        //ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegisterUser() {
        var firstName = String(FirstNameTextField.text!)
        var lastName = String(LastNameTextField.text!)
        var email = String(EmailTextField.text!)
        var birthDate = String(BirthDateTextField.text!)
        var userName = String(UsernameTextField.text!)
        let password = String(PasswordTextField.text!)
        
        if email != "" {
            if password != "" {
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    if user != nil {
                        let uid:String! = user!.uid
                        //let userRef: DatabaseReference = self.ref.child("users").child(uid)
                        let key = self.ref.child("users").childByAutoId().key
                        let values = ["uid": uid, "firstname": firstName, "lastname": lastName, "email": email, "birthdate": birthDate, "username": userName, "password": password]
                        let childUpdates = ["/users/\(uid!)": values]//, "/user-posts/\(userID)/\(key)/": post]
                        self.ref.updateChildValues(childUpdates)
                        self.performSegue(withIdentifier: "fromRegisterToHome", sender: self)
                    }
                    if let error = error {
                        self.ErrorMessageLabel.text = error.localizedDescription
                        return
                    }
                    
                }
            }
            else {
                self.ErrorMessageLabel.text = "Password field cannot be empty."
            }
        }
        else {
            self.ErrorMessageLabel.text = "Email field cannot be empty."
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(fo
         r segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
