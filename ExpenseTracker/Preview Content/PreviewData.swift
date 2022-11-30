//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Girish Potnuru on 22/11/22.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "11/22/2022", institution: "BankOfAmerica", account: "Visa BOA", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)


var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
