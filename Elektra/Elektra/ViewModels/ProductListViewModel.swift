//
//  ProductListViewModel.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 12/07/24.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    @Published var products: [Producto] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchProducts() {
        isLoading = true
        errorMessage = nil
        
        APIService.shared.fetchProducts { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let products):
                self.products = products
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
