//
//  LoginViewController.swift
//  Split Sheetz
//
//  Created by Verve on 11/22/17.
//  Copyright © 2017 Verve. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class LoginViewController: UIViewController {
    @IBOutlet weak var ErrorMessageLabel: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var FacebookLoginButton: UIButton!
    
    let currentUserAuth = Auth.auth().currentUser
    let ref: DatabaseReference! = Database.database().reference()
    let currentUserInfo:User! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setToolbarHidden(false, animated: false)
        
        PasswordTextField?.isSecureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginUser(_ sender: Any) {
        
        if let email = self.EmailTextField.text, let password = self.PasswordTextField.text {
            //showSpinner {
                // [START headless_email_auth]
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    // [START_EXCLUDE]
//                    self.hideSpinner {
                    if(user != nil)
                    {
                        //self.getUserInfo()
                        self.performSegue(withIdentifier: "fromLoginToHome", sender: self)
                    }
                    else if let error = error {
                        self.ErrorMessageLabel.text = error.localizedDescription
                        return
                    }
                        //self.navigationController!.popViewController(animated: true)
//                    }
                    // [END_EXCLUDE]
                }
                // [END headless_email_auth]
            //}
        } else {
            self.ErrorMessageLabel.text = "email/password can't be empty"
        }
    }

    func getUserInfo() {
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let uid = value?["uid"] as? String ?? ""
            let firstName = value?["firstname"] as? String ?? ""
            let lastName = value?["lastname"] as? String ?? ""
            let userName = value?["username"] as? String ?? ""
            let password = value?["password"] as? String ?? ""
            let email = value?["email"] as? String ?? ""
            let birthDate = value?["birthdate"] as? Date ?? Date()
            let photo = value?["photo"] as? String ?? ""
            let phoneNumber = value?["phonenumber"] as? String ?? ""
            let address = value?["address"] as? String ?? ""
            
            let user = User(uid: uid, firstName: firstName, lastName: lastName, userName: userName, password: password, email: email, birthDate: birthDate, photo: photo, phoneNumber: phoneNumber, address: address)
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
