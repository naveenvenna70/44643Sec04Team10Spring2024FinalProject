//
//  DebtSignUpVC.swift
//  DebtManagemenrt
//
//  Created by Naveen Reddy Venna on 4/15/24.
//

import UIKit

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
      
        if let email = EmailIdTF.text, let phonenumber = Number.text, let username = UserNameTF.text, let password = PasswordTF.text, let firstname = FirstNameTF.text, let lastname = LastNameTF.text, let confirmPassword = ConfirmPasswordTF.text{
                            if firstname == ""{
                                openAlert(title: "Alert", message: "Please enter firstname", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                            }else if lastname == ""{
                                openAlert(title: "Alert", message: "Please enter lastname", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                            } else if let emailError = inValidEmail(email) {
                                openAlert(title: "Alert", message: "emailError", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                            } else if username == ""{
                                openAlert(title: "Alert", message: "please enter valid username", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                            }else if let phoneError = isValidPhoneNumber(phonenumber) {
                                openAlert(title: "Alert", message: phoneError, alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                            }else if let passwordError = inValidPassword(password) {
                                openAlert(title: "Alert", message: passwordError, alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                print("Password is not valid")
                            } else {
                                if confirmPassword == "" {
                                    openAlert(title: "Alert", message: "Please confirm password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                    print("Please confirm password")
                                }else{
                                    if password == confirmPassword{
                                      openAlert(title: "Alert", message: "Account created", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                        
                                        FirstNameTF.text = ""
                                        LastNameTF.text = ""
                                        EmailIdTF.text = ""
                                        Number.text = ""
                                        PasswordTF.text = ""
                                        ConfirmPasswordTF.text = ""
                                        UserNameTF.text = ""
                                    }
                                    else{
                                        openAlert(title: "Alert", message: "password doesn't match", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                        print("password does not match")
                                    }
                                }
                            }
            
                        }else{
                            openAlert(title: "Alert", message: "please validate your details", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                            print("Please check your details")
                        }
        
                 performSegue(withIdentifier: "ShowtoLogin", sender: self)
        
                    }
                    
                    public func openAlert(title: String,
                                          message: String,
                                          alertStyle:UIAlertController.Style,
                                          actionTitles:[String],
                                          actionStyles:[UIAlertAction.Style],
                                          actions: [((UIAlertAction) -> Void)]){
                        
                        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
                        for(index, indexTitle) in actionTitles.enumerated(){
                            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
                            alertController.addAction(action)
                        }
                        self.present(alertController, animated: true)
            }
    }
    
    func inValidEmail(_ value: String) -> String?
            {
                let emailRegularExp =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegularExp)
                if !predicate.evaluate(with: value )
                {
                    return "Please enter valid email address"
                }
                return nil
            }
            func inValidPassword(_ value: String) -> String?
            {
                if value.count < 8
                {
                    return "Please enter password"
                }
                if containsDigit(value)
                {
                    return "Password Must contain at least 1 digit"
                }
                if containsLowerCase(value)
                {
                    return "Password Must contain at least 1 lowercase character"
                }
                if containsUpperCase(value)
                {
                    return "Password Must contain at least 1 uppercase character"
                }
                return nil
                
                func containsDigit(_ value: String) -> Bool
                {
                    let psdExpression = ".*[1-9]+.*"
                    let psdpredicate = NSPredicate(format: "SELF MATCHES %@", psdExpression)
                    return !psdpredicate.evaluate(with: value)
                }
                func containsLowerCase(_ value: String) -> Bool
                {
                    let psdExpression = ".*[a-z]+.*"
                    let psdpredicate = NSPredicate(format: "SELF MATCHES %@", psdExpression)
                    return !psdpredicate.evaluate(with: value)
                }
                func containsUpperCase(_ value: String) -> Bool
                {
                    let psdExpression = ".*[A-Z]+.*"
                    let psdpredicate = NSPredicate(format: "SELF MATCHES %@", psdExpression)
                    return !psdpredicate.evaluate(with: value)
                }
            }
            func isValidPhoneNumber(_ value: String) -> String? {
                let phoneRegex = #"^\d{10}$"#
                let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
                if !predicate.evaluate(with: value) {
                    return "Please enter valid 10 digits phone number"
                }
                return nil
            }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

