//
//  ContentView.swift
//  SnapLedger
//
//  Created by Rohan Ranjan on 12/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses: [Expense] = SampleData.expenses

    var body: some View {
        NavigationStack {
            List(expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.merchantName)
                            .font(.headline)
                        Text(expense.category.rawValue)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text(expense.amount, format: .currency(code: "USD"))
                        .font(.headline)
                }
            }
            .navigationTitle("SnapLedger")
        }
    }
}

#Preview {
    ContentView()
}
