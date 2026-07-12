//
//  SampleData.swift
//  SnapLedger
//
//  Created by Rohan Ranjan on 12/07/26.
//

import Foundation

enum SampleData {
    static let expenses: [Expense] = [
        Expense(merchantName: "Whole Foods", amount: 42.50, category: .groceries),
        Expense(merchantName: "Starbucks", amount: 6.75, category: .dining),
        Expense(merchantName: "Uber", amount: 18.20, category: .transport)
    ]
}
