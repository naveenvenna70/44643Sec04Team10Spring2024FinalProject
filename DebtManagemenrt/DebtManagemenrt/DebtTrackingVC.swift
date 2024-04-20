//
//  DebtTrackingVC.swift
//  DebtManagemenrt
//
//  Created by Navyasree Sriperumbudoor on 3/6/24.
//

import UIKit
import EventKit
import FirebaseCore
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import AudioToolbox

class DebtTrackingVC: UIViewController {
    
    var db: Firestore!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var UserUnterfaceSV: UIStackView!
    
    @IBOutlet weak var ServiceNoTF: UITextField!
    @IBOutlet weak var LoanIssueDateTF: UITextField!
    
    @IBOutlet weak var LoanAmountTF: UITextField!
    @IBOutlet weak var InterestrateTF: UITextField!
    @IBOutlet weak var NoOfYearsTF: UITextField!
    @IBOutlet weak var NoOfInstallmentTF: UITextField!
    @IBOutlet weak var TypeOfLoanTF: UITextField!
    
    @IBOutlet weak var DueDateTF: UITextField!
    @IBOutlet weak var Submit: UIButton!
    
    
    var paymentDate =  Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        datePicker.minimumDate = Date()
        self.LoanIssueDateTF.inputView =  datePicker
        self.DueDateTF.inputView =  datePicker
        self.showDatePicker()
    }
    
    
    
    @IBAction func SubmitBTN(_ sender: Any) {
        if(ServiceNoTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter service no.")
            return
        }
        
        if(self.LoanIssueDateTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter loan issued date.")
            return
        }
        if(self.LoanAmountTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter loan amount.")
            return
        }
        if(self.InterestrateTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter interest rate.")
            return
        }
        if(self.NoOfYearsTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter no of years.")
            return
        }
        if(self.NoOfInstallmentTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter no of installation.")
            return
        }
        if(self.TypeOfLoanTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter type of loan.")
            return
        }
        if(self.DueDateTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter payment date.")
            return
        }
        
        else{
            
            let caseDetails = LoanData(serviceNo: self.ServiceNoTF.text ?? "", loanIssuedDate: self.LoanIssueDateTF.text ?? "", loanAmount: self.LoanAmountTF.text ?? "", interestRate: self.InterestrateTF.text ?? "", noOfYears: self.NoOfYearsTF.text ?? "", noOfInstallment: self.NoOfInstallmentTF.text ?? "", typeOfLoan: self.TypeOfLoanTF.text ?? "", paymentDate: self.DueDateTF.text ?? "", useremail: UserDefaultsManager.shared.getEmail())
            
            FireStoreManager.shared.addDebtDataToFirestore(caseDetails) { success in
                if success{
                    UserDefaultsManager.shared.savePaymentData(paymentDate: self.paymentDate, NoOfInstallment: self.NoOfInstallmentTF.text ?? "")
                    showAlerOnTop(message: "Debt Tracking Confirmed. Debt has been added to your calendar.")
                }
            }
        }
    }
}
        
        extension DebtTrackingVC {
                func showDatePicker() {
                    //Formate Date
                    datePicker.datePickerMode = .date
                    if #available(iOS 13.4, *) {
                        datePicker.preferredDatePickerStyle = .wheels
                    } else {
                        // Fallback on earlier versions
                    }
                    //ToolBar
                    let toolbar = UIToolbar();
                    toolbar.sizeToFit()
                    
                    //done button & cancel button
                    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.donePicker))
                    doneButton.tintColor = .black
                    let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelDatePicker))
                    cancelButton.tintColor = .black
                    toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
                    
                    // add toolbar to textField
                    LoanIssueDateTF.inputAccessoryView = toolbar
                    DueDateTF.inputAccessoryView = toolbar

                    // add datepicker to textField
                    LoanIssueDateTF.inputView = datePicker
                    DueDateTF.inputView = datePicker

                }
                
            @objc func donePicker() {
                if LoanIssueDateTF.isFirstResponder {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MM/dd/yyyy"
                    LoanIssueDateTF.text = formatter.string(from: datePicker.date)
                } else if DueDateTF.isFirstResponder {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MM/dd/yyyy"
                    DueDateTF.text = formatter.string(from: datePicker.date)
                    self.paymentDate = datePicker.date
                }
                self.view.endEditing(true)
            }
                
                @objc func cancelDatePicker() {
                    self.view.endEditing(true)
                }

        }

    
    

    

