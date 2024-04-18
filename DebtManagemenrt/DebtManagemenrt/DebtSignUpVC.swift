//
//  DebtSignUpVC.swift
//  DebtManagemenrt
//
//  Created by Naveen Reddy Venna on 4/15/24.
//

import UIKit
import FirebaseAuth

class DebtSignUpVC: UIViewController {
    
    @IBOutlet weak var FirstNameTF: UITextField!
    @IBOutlet weak var LastNameTF: UITextField!
    @IBOutlet weak var EmailIdTF: UITextField!
    @IBOutlet weak var UserNameTF: UITextField!
    @IBOutlet weak var Number: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBOutlet weak var ConfirmPasswordTF: UITextField!
    @IBOutlet weak var Signup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Signup(_ sender: UIButton) {
        
        guard let firstname = FirstNameTF.text, !firstname.isEmpty else {
            openAlert(title: "Alert", message: "Please enter firstname!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        guard let lastname = LastNameTF.text, !lastname.isEmpty else {
            openAlert(title: "Alert", message: "Please enter lastname!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }

        guard let email = EmailIdTF.text, !email.isEmpty else {
            openAlert(title: "Alert", message: "Please enter email!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        guard let username = UserNameTF.text, !username.isEmpty else{
            openAlert(title: "Alert", message: "Please enter username!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        guard let number = Number.text, !number.isEmpty else {
            openAlert(title: "Alert", message: "Please enter number!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        guard let password = PasswordTF.text, !password.isEmpty else {
            openAlert(title: "Alert", message: "Please enter password!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }

        guard let conPassword = ConfirmPasswordTF.text, !conPassword.isEmpty else {
            openAlert(title: "Alert", message: "Please enter password in both fields!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        guard password == conPassword else {
            openAlert(title: "Alert", message: "Passwords do not match!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                let errorMessage = "Error creating user: \(error.localizedDescription)"
                openAlert(title: "Alert", message: "\(errorMessage)", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            } else {
                let successMessage = "User created successfully"
                openAlert(title: "Alert", message: "\(successMessage)", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                self.performSegue(withIdentifier: "ShowtoLogin", sender: self)
            }
        }
    }
    public func openAlert(title: String, message: String, alertStyle:UIAlertController.Style, actionTitles:[String], actionStyles:[UIAlertAction.Style], actions: [((UIAlertAction) -> Void)]){
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
            for(index, indexTitle) in actionTitles.enumerated(){
                let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
                alertController.addAction(action)
            }
            self.present(alertController, animated: true)
        }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


