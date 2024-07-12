//
//  ProductViewModel.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    private var cancellables = Set<AnyCancellable>()

    func fetchProducts() {
        APIService.shared.fetchProducts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching products: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] products in
                self?.products = products
            })
            .store(in: &cancellables)
    }
}
