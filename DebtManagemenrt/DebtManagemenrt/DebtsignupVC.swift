//
//  DebtsignupVC.swift
//  DebtManagemenrt
//
//  Created by Navyasree Sriperumbudoor on 2/22/24.
//

import UIKit

class DebtsignupVC: UIViewController {

    
    
    @IBOutlet weak var FirstnameSV: UIStackView!
    
    
    @IBOutlet weak var FirstNameLBL: UILabel!
    
    @IBOutlet weak var FirstNameTF: UITextField!
    
    
    @IBOutlet weak var SecondnameSV: UIStackView!
    
    
    @IBOutlet weak var LastNameLBL: UILabel!
    
    
    @IBOutlet weak var LastNameTF: UITextField!
    
    @IBOutlet weak var EmailSV: UIStackView!
    
    
    @IBOutlet weak var EmailIDLBL: UILabel!
    
    
    @IBOutlet weak var EmailIDTF: UITextField!
    
    
    @IBOutlet weak var UsernameSV: UIStackView!
    
    
    @IBOutlet weak var UserNameLBL: UILabel!
    
    @IBOutlet weak var UserNameTF: UITextField!
    
    
    @IBOutlet weak var NumberSV: UIStackView!
    
    
    @IBOutlet weak var PhonenumberLBL: UILabel!
    
    @IBOutlet weak var countryCodeTF: UITextField!
    
    @IBOutlet weak var NumberTF: UITextField!
    
    
    @IBOutlet weak var PasswordSV: UIStackView!
    
    
    @IBOutlet weak var PasswordLBL: UILabel!
    
    
    @IBOutlet weak var PasswordTF: UITextField!

    @IBOutlet weak var confirmUserNameLBL: UILabel!
    
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    
    @IBOutlet weak var SignupBTN: UIButton!
    
    
    @IBAction func SignUpBTN(_ sender: UIButton) {
        guard let email = EmailIDTF.text,
               let phonenumber = NumberTF.text,
               let password = PasswordTF.text,
               let firstName = FirstNameTF.text,
               let lastName = LastNameTF.text,
               let confirmPassword = confirmPasswordTF.text else {
             openAlert(title: "Alert", message: "Please validate your details", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
             print("Please check your details")
             return
         }
         
         if firstName.isEmpty {
             openAlert(title: "Alert", message: "Please enter firstname", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
             return
         }
         
         if lastName.isEmpty {
             openAlert(title: "Alert", message: "Please enter lastname", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
             return
         }
         
         if let emailError = inValidEmail(email) {
             openAlert(title: "Alert", message: emailError, alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
             return
         }
         
         if let phoneError = isValidPhoneNumber(phonenumber) {
             openAlert(title: "Alert", message: phoneError, alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
             return
         }
         
         if let passwordError = inValidPassword(password) {
             openAlert(title: "Alert", message: passwordError, alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
             print("Password is not valid")
             return
         }
         
         if confirmPassword.isEmpty {
             openAlert(title: "Alert", message: "Please confirm password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
             print("Please confirm password")
             return
         }
         
         if password != confirmPassword {
             openAlert(title: "Alert", message: "Passwords don't match", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
             print("Passwords don't match")
             return
         }
         
         openAlert(title: "Alert", message: "Account created", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
         FirstNameTF.text = ""
         LastNameTF.text = ""
         EmailIDTF.text = ""
         NumberTF.text = ""
         PasswordTF.text = ""
         confirmPasswordTF.text = ""
     }

     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
     }

     func inValidEmail(_ value: String) -> String? {
         let emailRegularExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegularExp)
         if !predicate.evaluate(with: value ) {
             return "Please enter valid email address"
         }
         return nil
     }

     func inValidPassword(_ value: String) -> String? {
         if value.count < 8 {
             return "Password must be at least 8 characters long"
         }
         if !containsDigit(value) {
             return "Password must contain at least 1 digit"
         }
         if !containsLowerCase(value) {
             return "Password must contain at least 1 lowercase character"
         }
         if !containsUpperCase(value) {
             return "Password must contain at least 1 uppercase character"
         }
         return nil
     }

     func containsDigit(_ value: String) -> Bool {
         let psdExpression = ".*[0-9]+.*"
         let psdpredicate = NSPredicate(format: "SELF MATCHES %@", psdExpression)
         return psdpredicate.evaluate(with: value)
     }

     func containsLowerCase(_ value: String) -> Bool {
         let psdExpression = ".*[a-z]+.*"
         let psdpredicate = NSPredicate(format: "SELF MATCHES %@", psdExpression)
         return psdpredicate.evaluate(with: value)
     }

     func containsUpperCase(_ value: String) -> Bool {
         let psdExpression = ".*[A-Z]+.*"
         let psdpredicate = NSPredicate(format: "SELF MATCHES %@", psdExpression)
         return psdpredicate.evaluate(with: value)
     }

     func isValidPhoneNumber(_ value: String) -> String? {
         let phoneRegex = #"^\d{10}$"#
         let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
         if !predicate.evaluate(with: value) {
             return "Please enter valid 10 digits phone number"
         }
         return nil
     }

     public func openAlert(title: String,
                           message: String,
                           alertStyle:UIAlertController.Style,
                           actionTitles:[String],
                           actionStyles:[UIAlertAction.Style],
                           actions: [((UIAlertAction) -> Void)]) {
         let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
         for (index, indexTitle) in actionTitles.enumerated() {
             let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
             alertController.addAction(action)
         }
         self.present(alertController, animated: true)
     }
 }
           
    

