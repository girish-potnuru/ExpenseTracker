//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Girish Potnuru on 24/11/22.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>

final class TransactionListViewModel: ObservableObject {
    
    @Published var transactions:[Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }.decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("error fetching responses", error.localizedDescription)
                case .finished:
                    print("finished fetching responses")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
                //dump(self?.transactions)
            }
            .store(in: &cancellables)
    }
    
    func groupTransactionByMonth() -> TransactionGroup {
        
      guard !transactions.isEmpty else { return [:] }
      let groupedTransaction = TransactionGroup(grouping: transactions) { $0.month}
      return groupedTransaction
    }
    
}
