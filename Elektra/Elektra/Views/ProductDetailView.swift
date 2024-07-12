//
//  ProductDetailView.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack {
            if let imageUrl = product.urlImagenes.first {
                AsyncImage(url: URL(string: imageUrl))
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Text(product.nombre)
                .font(.largeTitle)
                .padding()
            Text("Precio Regular: \(product.precioRegular, specifier: "%.2f")")
            Text("Precio Final: \(product.precioFinal, specifier: "%.2f")")
            Spacer()
        }
        .padding()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: "1", nombre: "Producto Ejemplo", precioRegular: 100, precioFinal: 80, descuento: true, urlImagenes: ["https://example.com/image.png"]))
    }
}
