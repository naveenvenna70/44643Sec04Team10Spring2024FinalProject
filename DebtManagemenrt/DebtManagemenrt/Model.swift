//
//  Model.swift
//  DebtManagemenrt
//
//  Created by Macbook-Pro on 17/04/24.
//

import Foundation

struct LoanData: Codable {
    var serviceNo: String?
    var loanIssuedDate: String?
    var loanAmount: String?
    var interestRate: String?
    var noOfYears: String?
    var noOfInstallment: String?
    var typeOfLoan: String?
    var paymentDate: String?
    var useremail: String?

    enum CodingKeys: String, CodingKey {
        case serviceNo
        case loanIssuedDate
        case loanAmount
        case interestRate
        case noOfYears
        case noOfInstallment
        case typeOfLoan
        case paymentDate
        case useremail
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(serviceNo, forKey: .serviceNo)
        try container.encode(loanIssuedDate, forKey: .loanIssuedDate)
        try container.encode(loanAmount, forKey: .loanAmount)
        try container.encode(interestRate, forKey: .interestRate)
        try container.encode(noOfYears, forKey: .noOfYears)
        try container.encode(noOfInstallment, forKey: .noOfInstallment)
        try container.encode(typeOfLoan, forKey: .typeOfLoan)
        try container.encode(paymentDate, forKey: .paymentDate)
        try container.encode(useremail, forKey: .useremail)
    }
}
