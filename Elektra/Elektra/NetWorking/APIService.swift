//
//  APIService.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()

    func fetchProducts() -> AnyPublisher<[Product], NetworkError> {
        let url = URL(string: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .mapError { _ in NetworkError.fetchError }
            .eraseToAnyPublisher()
    }
}
