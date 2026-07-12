//
//  Expense.swift
//  SnapLedger
//
//  Created by Rohan Ranjan on 12/07/26.
//

import Foundation

struct Expense: Identifiable, Codable {
    let id: UUID
    var merchantName: String
    var amount: Double
    var category: ExpenseCategory
    var date: Date
    var rawOCRText: String?

    init(id: UUID = UUID(), merchantName: String, amount: Double, category: ExpenseCategory, date: Date = Date(), rawOCRText: String? = nil) {
        self.id = id
        self.merchantName = merchantName
        self.amount = amount
        self.category = category
        self.date = date
        self.rawOCRText = rawOCRText
    }
}

enum ExpenseCategory: String, Codable, CaseIterable {
    case groceries = "Groceries"
    case dining = "Dining"
    case transport = "Transport"
    case shopping = "Shopping"
    case bills = "Bills"
    case other = "Other"
}
