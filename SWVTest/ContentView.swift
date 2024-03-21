//
//  ContentView.swift
//  SWVTest
//
//  Created by Guillaume Coquard on 21/03/24.
//

import SwiftUI
import SUIWebView

struct ContentView: View {

    @State private var state: SUIState = .init()
    @State private var inset: CGFloat = 100.0
    @FocusState private var isKeyboardFocus: Bool

    var body: some View {
        VStack {

            SUIWebView(state)
                .set(\.scrollView.contentInset, to: .init(inset))
                .set(\.isOpaque, to: false)
                .ignoresSafeArea(.all)
                .background(.red)

            VStack(spacing: 8) {
                HStack {
                    TextField("Search", text: $state.query)
                        .keyboardType(.webSearch)
                        .focused($isKeyboardFocus)
                        .onSubmit {
                            state.load()
                            isKeyboardFocus = false
                        }

                    Button("Search", systemImage: "magnifyingglass") {
                        state.load()
                        isKeyboardFocus = false
                    }
                    .buttonStyle(.borderedProminent)
                    .labelStyle(.iconOnly)
                }
                HStack {
                    Slider(value: $inset, in: 0.0...120.0, step: 20.0) {
                        Label("Inset", systemImage: "rectangle.inset.fill")
                    }
                }
            }
            .padding()
        }
    }
}


