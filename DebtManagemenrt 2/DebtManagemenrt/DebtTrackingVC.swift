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

class DebtTrackingVC: UIViewController {
    
    var db: Firestore!
    let datePicker = UIDatePicker()

    @IBOutlet weak var UserInterfaceSV: UIStackView!
    
    @IBOutlet weak var ServiceNOSV: UIStackView!
    
    @IBOutlet weak var ServiceNO: UILabel!
    
    
    @IBOutlet weak var ServiceNoTF: UITextField!
    
    @IBOutlet weak var LoanDateSV: UIStackView!
    
    @IBOutlet weak var LoanIssuedDate: UILabel!
    
    @IBOutlet weak var LoanIssuedDateTF: UITextField!
    
    @IBOutlet weak var LoanAmtSV: UIStackView!
    
    @IBOutlet weak var LoanAmountLBL: UILabel!
    
    @IBOutlet weak var LoanAmountTF: UITextField!
    
    @IBOutlet weak var InterestRateSV: UIStackView!
    
    @IBOutlet weak var InterestRateLBL: UILabel!
    
    @IBOutlet weak var InterestRateTF: UITextField!
    
    @IBOutlet weak var PrincipleSV: UIStackView!
    
    @IBOutlet weak var PrincipleLBL: UILabel!
    
    @IBOutlet weak var PrincipleTF: UITextField!
    
    @IBOutlet weak var NoOfYearsSV: UIStackView!
    
    @IBOutlet weak var NoOfYearsLBL: UILabel!
    
    @IBOutlet weak var NoOfYearsTF: UITextField!
    
    @IBOutlet weak var noofInstallmentSV: UIStackView!
    
    @IBOutlet weak var NoOfInstallmentsLBL: UILabel!
    
    @IBOutlet weak var NoOfInstallmentTF: UITextField!
    @IBOutlet weak var paymentDateTF: UITextField!

    
    @IBOutlet weak var RemainingBlcSV: UIStackView!
    
    @IBOutlet weak var RemainingBalanceLBL: UILabel!
    
    @IBOutlet weak var RemainingBalanceTF: UITextField!
    
    @IBOutlet weak var CalcAmtSV: UIStackView!
    
    @IBOutlet weak var CalcAmorintLBL: UILabel!
    
    @IBOutlet weak var CalcAmTF: UITextField!
    
    @IBOutlet weak var TypeLoanSV: UIStackView!
    
    @IBOutlet weak var TypeofLoanLBL: UILabel!
    
    @IBOutlet weak var TypeofLoanTF: UITextField!
    
    @IBOutlet weak var NoMonthSV: UIStackView!
    
    @IBOutlet weak var NoofMonthsLBL: UILabel!
    
    @IBOutlet weak var NoofMonthsTF: UITextField!
    
    @IBOutlet weak var interestAmtSV: UIStackView!
    
    @IBOutlet weak var interestAmountTF: UITextField!
    
    
    
    @IBOutlet weak var TypeInstallmentSV: UIStackView!
    
    
    @IBOutlet weak var TypeofInstallmentLBL: UILabel!
    
    
    @IBOutlet weak var TypeofInstallmentTF: UITextField!
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    var paymentDate =  Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        datePicker.minimumDate = Date()
        self.LoanIssuedDateTF.inputView =  datePicker
        self.paymentDateTF.inputView =  datePicker
        self.showDatePicker()
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        if(ServiceNoTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter service no.")
            return
        }
        
        if(self.LoanIssuedDateTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter loan issued date.")
            return
        }
        if(self.LoanAmountTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter loan amount.")
            return
        }
        if(self.InterestRateTF.text!.isEmpty) {
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
        if(self.TypeofLoanTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter type of loan.")
            return
        }
        if(self.paymentDateTF.text!.isEmpty) {
            showAlerOnTop(message: "Please enter payment date.")
            return
        }
        
        else{
            
            let caseDetails = LoanData(serviceNo: self.ServiceNoTF.text ?? "", loanIssuedDate: self.LoanIssuedDateTF.text ?? "", loanAmount: self.LoanAmountTF.text ?? "", interestRate: self.InterestRateTF.text ?? "", noOfYears: self.NoOfYearsTF.text ?? "", noOfInstallment: self.NoOfInstallmentTF.text ?? "", typeOfLoan: self.TypeofLoanTF.text ?? "", paymentDate: self.paymentDateTF.text ?? "", useremail: UserDefaultsManager.shared.getEmail())
            
            FireStoreManager.shared.addDebtDataToFirestore(caseDetails) { success in
                if success{
                    UserDefaultsManager.shared.savePaymentData(paymentDate: self.paymentDate, NoOfInstallment: self.NoOfInstallmentTF.text ?? "")
                    showAlerOnTop(message: "Debt Tracking Confirmed. Debt has been added to your calendar.")
                }
                }
            
        }
    }
    
    @IBAction func ServiceNo(_ sender: UITextField) {
    }
    
    
    @IBAction func LoanIssuedDate(_ sender: UITextField) {
    }
    
    
    @IBAction func LoanAmount(_ sender: UITextField) {
    }
    
    
    @IBAction func InterestRate(_ sender: UITextField) {
    }
    
    
    @IBAction func Principle(_ sender: UITextField) {
    }
    
    
    @IBAction func NoofYears(_ sender: UITextField) {
    }
    
    
    @IBAction func NoofInstallment(_ sender: UITextField) {
    }
    
    
    @IBAction func RemainingBalance(_ sender: UITextField) {
    }
    
    
    @IBAction func CalcAmount(_ sender: UITextField) {
    }
    
    
    @IBAction func TypeofLoan(_ sender: UITextField) {
    }
    
    
    @IBAction func NoofMonths(_ sender: UITextField) {
    }
    
    
    @IBAction func InterestAmount(_ sender: UITextField) {
    }
    
    
    @IBAction func TypeofInstallment(_ sender: UITextField) {
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
            LoanIssuedDateTF.inputAccessoryView = toolbar
            paymentDateTF.inputAccessoryView = toolbar

            // add datepicker to textField
            LoanIssuedDateTF.inputView = datePicker
            paymentDateTF.inputView = datePicker

        }
        
    @objc func donePicker() {
        if LoanIssuedDateTF.isFirstResponder {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            LoanIssuedDateTF.text = formatter.string(from: datePicker.date)
        } else if paymentDateTF.isFirstResponder {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            paymentDateTF.text = formatter.string(from: datePicker.date)
            self.paymentDate = datePicker.date
        }
        self.view.endEditing(true)
    }
        
        @objc func cancelDatePicker() {
            self.view.endEditing(true)
        }

}
