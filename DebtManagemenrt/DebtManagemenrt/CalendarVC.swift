//
//  CalendarVC.swift
//  DebtManagemenrt
//
//  Created by venkat on 11/04/24.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController, FSCalendarDelegate, FSCalendarDataSource  {
    
    
    
    @IBOutlet weak var CalendarLV: FSCalendar!
    @IBOutlet weak var MessageLBL: UILabel!
    
    var paymentDate: Date?
    var noOfInstallments: Int?
    
    @IBOutlet weak var previousMonthButton: UIButton!
    @IBOutlet weak var nextMonthButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CalendarLV.delegate = self
        CalendarLV.dataSource = self
        CalendarLV.allowsMultipleSelection = true

        self.paymentDate = UserDefaultsManager.shared.getPaymentDate()
        self.noOfInstallments = Int(UserDefaultsManager.shared.getNoOfInstallment())
        
        if let paymentDate = paymentDate, let noOfInstallments = noOfInstallments {
            highlightInstallmentDates(from: paymentDate, count: noOfInstallments)
        }
        
        nextMonthButton.addTarget(self, action: #selector(showNextMonth), for: .touchUpInside)
        
        previousMonthButton.addTarget(self, action: #selector(showPreviousMonth), for: .touchUpInside)
    }
    
    @objc func showPreviousMonth() {
        let currentPageDate = CalendarLV.currentPage
        
        var dateComponents = DateComponents()
        dateComponents.month = -1
        
        if let previousMonthDate = Calendar.current.date(byAdding: dateComponents, to: currentPageDate) {
            CalendarLV.setCurrentPage(previousMonthDate, animated: true)
        }
    }
    
    @objc func showNextMonth() {
        let currentPageDate = CalendarLV.currentPage
        
        var dateComponents = DateComponents()
        dateComponents.month = 1
        
        if let nextMonthDate = Calendar.current.date(byAdding: dateComponents, to: currentPageDate) {
            CalendarLV.setCurrentPage(nextMonthDate, animated: true)
        }
    }
    
    
    func highlightInstallmentDates(from startDate: Date, count: Int) {
            var installmentDates: [Date] = []
            let gregorianCalendar = Calendar.current
            
            for i in 0..<count {
                if let installmentDate = gregorianCalendar.date(byAdding: .month, value: i, to: startDate) {
                    installmentDates.append(installmentDate)
                }
            }
            
            for date in installmentDates {
                CalendarLV.select(date)
                
            }
        }
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
        return [UIColor.red]
    }
    
}

