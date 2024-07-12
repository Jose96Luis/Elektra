//
//  ProductRowView.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product

    var body: some View {
        HStack {
            // Mostrar imagen del producto
            if let imageUrl = product.urlImagenes.first {
                AsyncImage(url: URL(string: imageUrl))
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            VStack(alignment: .leading) {
                Text(product.nombre)
                    .font(.headline)
                Text("Precio: \(product.precioFinal, specifier: "%.2f")")
                    .font(.subheadline)
            }
            Spacer()
            if product.descuento {
                Text("Descuento")
                    .font(.caption)
                    .padding(4)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
        .padding()
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: Product(id: "1", nombre: "Producto Ejemplo", precioRegular: 100, precioFinal: 80, descuento: true, urlImagenes: ["https://example.com/image.png"]))
            .previewLayout(.sizeThatFits)
    }
}
