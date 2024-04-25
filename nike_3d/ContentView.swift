//
//  ContentView.swift
//  shoes_app
//
//  Created by Marcelo Amaral Alves on 2024-04-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            Home()
        })
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
