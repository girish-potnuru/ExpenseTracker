//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Girish Potnuru on 29/11/22.
//

import SwiftUI

struct RecentTransactionList: View {
    
    @EnvironmentObject var transactionListView: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                // MARK: Header Link
                Spacer()
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }.padding(.top)
            
            ForEach(Array(transactionListView.transactions.prefix(5).enumerated()), id: \.element) {index, transaction in
                 TransactionRow(transaction: transaction)
                Divider().opacity(index == 4 ? 0 : 1)
            }
        }.padding()
        .background(Color.sytemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color:Color.primary.opacity(0.2), radius: 10.0,x: 0,y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionVM = TransactionListViewModel()
        transactionVM.transactions = transactionListPreviewData
        return transactionVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                RecentTransactionList()
            }
            NavigationView {
                RecentTransactionList().preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
