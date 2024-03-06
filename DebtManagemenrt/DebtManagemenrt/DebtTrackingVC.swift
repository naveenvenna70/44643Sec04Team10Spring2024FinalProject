//
//  DebtTrackingVC.swift
//  DebtManagemenrt
//
//  Created by Navyasree Sriperumbudoor on 3/6/24.
//

import UIKit

class DebtTrackingVC: UIViewController {
    
    
    @IBOutlet weak var BigContainerSV: UIStackView!
    
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
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
