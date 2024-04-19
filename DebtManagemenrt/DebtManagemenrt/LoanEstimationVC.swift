//
//  LoanEstimationVC.swift
//  DebtManagemenrt
//
//  Created by Navyasree Sriperumbudoor on 3/8/24.
//

import UIKit
import Eureka
import CoreML
import AudioToolbox

class LoanEstimationVC: FormViewController {
    var Self_Employed: Bool = false
    var LoanAmount: Double = 1000
    var income: Double = 1000
    var previoslyTakenLoan_Credit_History: Bool = false
    var numberOFdays: Int = 360
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loanPredict()
    }
    
    func loanPredict() {
        form +++
        LabelRow () {
            $0.title = "Fill in all the details to get the loan prediction."
            $0.cellStyle = .subtitle
        }.cellSetup { cell, row in
            cell.textLabel?.numberOfLines = 2
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: (cell.textLabel?.font.pointSize)!)
        }
        
        form +++ Section("Loan Information")
        
        <<< SwitchRow() {
            $0.title = "Self Employed"
        }.onChange { [weak self] row in
            self?.Self_Employed = row.value ?? false
        }
        
        <<< DecimalRow() {
            $0.title = "Loan Amount"
            $0.value = 1000
            $0.placeholder = "Enter Loan Amount"
        }.onChange { [weak self] row in
            self?.LoanAmount = row.value ?? 0.0
        }
        
        
        <<< DecimalRow() {
            $0.title = "Income"
            $0.value = 1000
            $0.placeholder = "Enter Income"
        }.onChange { [weak self] row in
            self?.income = row.value ?? 0.0
        }
        
        <<< SwitchRow() {
            $0.title = "Previously Taken Loan/Credit History"
        }.onChange { [weak self] row in
            self?.previoslyTakenLoan_Credit_History = row.value ?? false
        }
        
        <<< IntRow() {
            $0.title = "Number of Days"
            $0.placeholder = "Enter Number of Days"
            $0.value = 360
        }.onChange { [weak self] row in
            self?.numberOFdays = row.value ?? 0
        }
        
        form +++ Section("Actions")
        
        <<< ButtonRow() {
            $0.title = "Predict"
        }
        .onCellSelection { cell, row in
            row.section?.form?.validate()
            self.recordForSocrePredict()
        }
        
        <<< ButtonRow() {
            $0.title = "Clear"
        }
        .onCellSelection { [weak self] cell, row in
            self?.form.removeAll()
            self?.resetloanPredict()
            self?.loanPredict()
            print("Clear")
        }
    }
    
    func resetloanPredict(){
        self.Self_Employed = false
        self.LoanAmount = 0.0
        self.previoslyTakenLoan_Credit_History = false
        self.numberOFdays = 0
    }
    
    func recordForSocrePredict() {
        form.validate()
        
        
        
        if LoanAmount < 1 || numberOFdays < 1{
            showAlert(message: "Loan amount and number of days cannot be zero.")
            return
        }
        
        
        
        var employe = 0
        
        if(Self_Employed == true ) {
            employe = 1
        }
        
        var credit_history = 0
        
        if(previoslyTakenLoan_Credit_History == true ) {
            credit_history = 1
        }
        
        
        let loan = try! LoanML(configuration: MLModelConfiguration())
        
        
        
        let prediction = try? loan.prediction(Self_Employed: Int64(employe), ApplicantIncome: Int64(income), LoanAmount: Int64(LoanAmount), Loan_Amount_Term: Int64(numberOFdays), Credit_History: Int64(credit_history))
        
        let status = prediction?.Loan_Status ?? 0.0
        
        
        let message: String
        if status > 0.5 {
            message = "Loan can be approved."
        } else {
            message = "Loan cannot be approved."
        }
        
        showAlert(message: message)
        
        
        
        
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Loan Prediction", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
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
