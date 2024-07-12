//
//  ContentView.swift
//  Elektra
//
//  Created by José Rodriguez Romero on 11/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()

    var body: some View {
        ProductListView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
