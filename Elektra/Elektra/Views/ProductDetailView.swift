//
//  ProductDetailView.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Producto

    var body: some View {
        VStack {
            if let imageUrl = product.urlImagenes.first, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                } placeholder: {
                    ProgressView()
                }
            }
            Text(product.nombre)
                .font(.largeTitle)
                .padding()
            Text("$\(product.precioFinal, specifier: "%.2f")")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle(product.nombre)
        .padding()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleProduct = Producto(id: UUID(), nombre: "Ejemplo de Producto", precioFinal: 99.99, urlImagenes: ["https://via.placeholder.com/150"])
        ProductDetailView(product: exampleProduct)
    }
}
