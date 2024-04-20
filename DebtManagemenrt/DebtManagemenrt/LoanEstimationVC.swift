import UIKit
import Eureka
import CoreML
import AudioToolbox

class LoanEstimationVC: FormViewController {
    var Self_Employed: Bool = false
    var LoanAmount: Double = 1000
    var income: Double = 0.0
    var previoslyTakenLoan_Credit_History: Bool = false
    var numberofmonths: Int = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForm()
    }
    
    func setupForm() {
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
            if let amount = row.value, (1000...10_000_000).contains(amount) {
                self?.LoanAmount = amount
            } else {
                row.value = self?.LoanAmount
            }
        }
        
        <<< DecimalRow() {
            $0.title = "Income"
            $0.value = 0.0
            $0.placeholder = "Enter Income"
        }.onChange { [weak self] row in
            if let income = row.value, (1000...100_000).contains(income) {
                self?.income = income
            } else {
                row.value = self?.income
            }
        }
        
        <<< SwitchRow() {
            $0.title = "Previously Taken Loan/Credit History"
        }.onChange { [weak self] row in
            self?.previoslyTakenLoan_Credit_History = row.value ?? false
        }
        
        <<< IntRow() {
            $0.title = "Number of Months"
            $0.placeholder = "Enter Number of Months"
            $0.value = 12
        }.onChange { [weak self] row in
            self?.numberofmonths = row.value ?? 0
        }
        
        form +++ Section("Actions")
        
        <<< ButtonRow() {
            $0.title = "Predict"
        }
        .onCellSelection { cell, row in
            row.section?.form?.validate()
            self.recordForScorePredict()
        }
        
        <<< ButtonRow() {
            $0.title = "Clear"
        }
        .onCellSelection { [weak self] cell, row in
            self?.form.removeAll()
            self?.resetloanPredict()
            self?.setupForm()
            print("Clear")
        }
    }
    
    func resetloanPredict(){
        self.Self_Employed = false
        self.LoanAmount = 1000
        self.income = 0.0
        self.previoslyTakenLoan_Credit_History = false
        self.numberofmonths = 12
    }
    
    func recordForScorePredict() {
        form.validate()
        
        if LoanAmount < 1000 || LoanAmount > 10_000_000 || income < 1000 || income > 100_000 || numberofmonths < 1 {
            showAlert(message: "Loan cannot be approved.")
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
        
        let prediction = try? loan.prediction(Self_Employed: Int64(employe), ApplicantIncome: Int64(income), LoanAmount: Int64(LoanAmount), Loan_Amount_Term: Int64(numberofmonths), Credit_History: Int64(credit_history))
        
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
}
