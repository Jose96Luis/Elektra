//
//  ProductDetailView.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: String
    
    var body: some View {
        VStack {
            Text(product)
                .font(.largeTitle)
                .padding()
            
            Text("Random product details go here.")
                .padding()
        }
        .navigationTitle("Product Detail")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: "Product 1")
    }
}
