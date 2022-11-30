//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Girish Potnuru on 30/11/22.
//

import SwiftUI

struct TransactionList: View {
    
    @EnvironmentObject var trasactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(trasactionListVM.groupTransactionByMonth()), id: \.key) { month, transactions in
                    Section {
                        ForEach(transactions) { transaction in
                           TransactionRow(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }.listSectionSeparator(.hidden)
                }
            }
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionVM = TransactionListViewModel()
        transactionVM.transactions = transactionListPreviewData
        return transactionVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList().preferredColorScheme(.dark)
            }
        }.environmentObject(transactionListVM)
    }
}
