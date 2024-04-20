//
//  DebtVC.swift
//  DebtManagemenrt
//
//  Created by venkat on 20/02/24.
//

import UIKit
import Firebase
import FirebaseAuth
import AudioToolbox


class DebtVC: UIViewController {
    
    
    @IBOutlet weak var usernameTF: UITextField!
    
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    @IBOutlet weak var LOGINBTN: UIButton!
    
    @IBOutlet weak var RegisterBTN: UIButton!
    
    
    @IBOutlet weak var MessageLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerBTN(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowtoSignup", sender: self)
    }
    @IBAction func LoginBTN(_ sender: Any) {
        guard let email = usernameTF.text, !email.isEmpty else {
            self.MessageLBL.text = "Email address not found"
            return
        }
        
        guard let password = PasswordTF.text, !password.isEmpty else {
            self.MessageLBL.text = "Please enter valid password"
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if error != nil {
                self.MessageLBL.text = "Invalid Login Credentials! Please try again."
            } else {
                self.performSegue(withIdentifier: "ShowtoHome", sender: sender)
            }
            
        }
        
    }
    
    @IBAction func Username(_ sender: Any) {
        guard let username = self.usernameTF.text, !username.isEmpty else{return}
        self.PasswordTF.isEnabled = true
    }
    
    
    @IBAction func PasswordTF(_ sender: Any) {
        guard let password = self.PasswordTF.text, !password.isEmpty else{return}
        self.PasswordTF.isEnabled = true
    }
    
    @IBAction func ForgotPassword(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ShowtoForgot", sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
