//
//  ForgotPasswordVC.swift
//  DebtManagemenrt
//
//  Created by Naveen Reddy Venna on 4/19/24.
//

import UIKit
import FirebaseAuth
import AudioToolbox

class ForgotPasswordVC: UIViewController {
    @IBOutlet weak var EmailLBL: UILabel!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var SubmitBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        guard let email = EmailTF.text, !email.isEmpty else {
                                    openAlert(title: "Alert", message: "Please enter email!", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in }])
                                    return
                                }
                                Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
                                    guard let self = self else { return }
                                    if let error = error {
                                        openAlert(title: "Alert", message: "Error sending reset email:", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in }])
                                    } else {
                                        openAlert(title: "Alert", message: "Reset email sent successfully", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in }])
                                        EmailTF.text = ""
                                    }
                                }
    }
    func openAlert(title: String, message: String, alertStyle: UIAlertController.Style, actionTitles: [String], actionStyles: [UIAlertAction.Style], actions: [((UIAlertAction) -> Void)?]) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
            
            for (index, title) in actionTitles.enumerated() {
                let style = actionStyles[index]
                let action = UIAlertAction(title: title, style: style, handler: actions[index])
                alertController.addAction(action)
            }
            
            present(alertController, animated: true, completion: nil)
        }
        
    
    }
 
    
