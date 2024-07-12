//
//  ProductModel.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import Foundation
/*
 struct ProductResponse: Codable {
 let mensaje: String
 let advertencia: String
 let resultado: Resultado
 }
 
 struct Resultado: Codable {
 let paginacion: Paginacion
 let categoria: String
 let productos: [Producto]
 }
 
 struct Paginacion: Codable {
 let pagina: Int
 let totalPaginas: Int
 let totalRegistros: Int
 let totalRegistrosPorPagina: Int
 }*/

struct Producto: Identifiable, Decodable {
    let id: UUID
    let nombre: String
    let precioFinal: Double
    let urlImagenes: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case nombre
        case precioFinal
        case urlImagenes
    }
}
