//
//  ProductListView.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ProductViewModel

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductRowView(product: product)
                }
            }
            .navigationTitle("Productos")
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductViewModel()
        viewModel.products = [Product(id: "1", nombre: "Producto Ejemplo", precioRegular: 100, precioFinal: 80, descuento: true, urlImagenes: ["https://example.com/image.png"])]
        return ProductListView(viewModel: viewModel)
    }
}
