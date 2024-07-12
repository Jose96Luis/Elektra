//
//  ProductListView.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando productos...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductRowView(product: product)
                        }
                    }
                }
            }
            .navigationTitle("Productos")
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}

struct ProductRowView: View {
    let product: Producto

    var body: some View {
        HStack {
            if let imageUrl = product.urlImagenes.first, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }
            }
            VStack(alignment: .leading) {
                Text(product.nombre)
                    .font(.headline)
                Text("$\(product.precioFinal, specifier: "%.2f")")
                    .font(.subheadline)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
