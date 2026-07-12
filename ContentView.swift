//
//  ContentView.swift
//  SnapLedger
//
//  Created by Rohan Ranjan on 12/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses: [Expense] = SampleData.expenses
    @State private var showScanner = false
    @State private var scannedText = ""
    @State private var showRawText = false

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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showScanner = true
                    } label: {
                        Image(systemName: "camera.fill")
                    }
                }
            }
            .sheet(isPresented: $showScanner) {
                ReceiptScannerView { image in
                    ReceiptOCRService.recognizeText(from: image) { text in
                        DispatchQueue.main.async {
                            scannedText = text
                            showRawText = true
                        }
                    }
                }
            }
            .alert("Scanned Text", isPresented: $showRawText) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(scannedText)
            }
        }
    }
}

#Preview {
    ContentView()
}
