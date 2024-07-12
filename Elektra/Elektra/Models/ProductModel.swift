//
//  ProductModel.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: String
    let nombre: String
    let precioRegular: Double
    let precioFinal: Double
    let descuento: Bool
    let urlImagenes: [String]
}
