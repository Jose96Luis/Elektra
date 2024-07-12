//
//  ProductListView.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import SwiftUI

struct ProductListView: View {
    let products = ["Product 1", "Product 2", "Product 3"]
    
    var body: some View {
        List(products, id: \.self) { product in
            NavigationLink(destination: ProductDetailView(product: product)) {
                Text(product)
            }
        }
        .navigationTitle("Product List")
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
