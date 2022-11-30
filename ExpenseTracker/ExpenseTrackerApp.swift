//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Girish Potnuru on 22/11/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
