//
//  PaymentScheduleVC.swift
//  DebtManagemenrt
//
//  Created by venkat on 08/03/24.
//

import UIKit

class PaymentScheduleVC: UIViewController {
    @IBOutlet weak var LoanAmountTF: UITextField!
    
    @IBOutlet weak var paymentStartDateTF: UITextField!
    
    @IBOutlet weak var EstimatedLoanDeadlineTF: UITextField!
    
    @IBOutlet weak var EstimatedmonthlyDueDateTF: UITextField!
    
    @IBOutlet weak var IfNotPaidEstimatedAmountToBePiadTF: UITextField!
    
    @IBOutlet weak var EstimatedCreditScoreTF: UITextField!
    
    @IBOutlet weak var CompleteTransactionsTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
