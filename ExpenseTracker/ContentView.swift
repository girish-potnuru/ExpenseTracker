//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Girish Potnuru on 22/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                // MARK Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
            
        }.navigationViewStyle(.stack)
            .accentColor(.primary)

    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionVM = TransactionListViewModel()
        transactionVM.transactions = transactionListPreviewData
        return transactionVM
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView().preferredColorScheme(.dark)
        }.environmentObject(transactionListVM)
    }
}
