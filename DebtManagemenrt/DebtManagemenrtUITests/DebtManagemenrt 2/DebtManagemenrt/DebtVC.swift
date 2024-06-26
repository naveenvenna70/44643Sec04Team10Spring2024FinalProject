//
//  DebtVC.swift
//  DebtManagemenrt
//
//  Created by venkat on 20/02/24.
//

import UIKit
import Lottie
import Firebase

class DebtVC: UIViewController {
   
    @IBOutlet weak var LaunchLAV: LottieAnimationView!{
        didSet{
            LaunchLAV.animation = .named("Animation")
            LaunchLAV.alpha=1
            LaunchLAV.play(){[weak self] _ in
                        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 0.1, options: [.curveEaseIn]){
                            self!.LaunchLAV.alpha = 0
                        }
                    }
                }
            }
    

    
    
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
        if(usernameTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter your email id.")
            return
        }
        
        if(self.PasswordTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter your password.")
            return
        }
        else{
            UserDefaultsManager.shared.saveData(name: "", email: self.usernameTF.text ?? "", phone: "")
            return performSegue(withIdentifier: "ShowToHome", sender: self)
        }
    }
    
    @IBAction func Username(_ sender: Any) {
        if let Username = usernameTF.text{
                    if let message = inValidEmail(Username){
                        MessageLBL.text = message
                        MessageLBL.isHidden = false
                    }
                    else
                    
                    {
                        MessageLBL.isHidden = true
                    }
                }
                checkvalid()
    }
    func checkvalid()
        {
            if MessageLBL.isHidden == true
            {
                LOGINBTN.isEnabled = true
            }else{
                LOGINBTN.isEnabled = false
            }
        }
    func inValidEmail(_ value: String) -> String?
        {
            let emailRegularExp =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegularExp)
            if !predicate.evaluate(with: value )
            {
                return "Invalid Email Address "
            }
            return nil
        }
    func resetForm()
        {
            LOGINBTN.isEnabled = false
            MessageLBL.isHidden = false
            MessageLBL.text = "Required to fill the fields"
            
            usernameTF.text = ""
            PasswordTF.text = ""
            
            
        }
    
    
    @IBAction func PasswordTF(_ sender: Any) {
        if let password = PasswordTF.text{
            if let message = inValidPassword(password){
                MessageLBL.text = message
                MessageLBL.isHidden = false
            }
            else
            
            {
                MessageLBL.isHidden = true
            }
        }
        checkvalid()
        
    }
        
        
    func inValidPassword(_ value: String) -> String?
    {
    if value.count < 8
    {
        return "Password Must contain at least 8 characters"
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
        let psdExpression = ".[1-9]+."
        let psdpredicate = NSPredicate(format: "SELF MATCHES %@", psdExpression)
        return !psdpredicate.evaluate(with: value)
    }
    func containsLowerCase(_ value: String) -> Bool
    {
        let psdExpression = ".[a-z]+."
        let psdpredicate = NSPredicate(format: "SELF MATCHES %@", psdExpression)
        return !psdpredicate.evaluate(with: value)
    }
    func containsUpperCase(_ value: String) -> Bool
    {
        let psdExpression = ".[A-Z]+."
        let psdpredicate = NSPredicate(format: "SELF MATCHES %@", psdExpression)
        return !psdpredicate.evaluate(with: value)
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

}
