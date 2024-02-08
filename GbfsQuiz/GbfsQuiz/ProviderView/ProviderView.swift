//
//  ProviderView.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 06/02/2024.
//

import SwiftUI

struct ProviderView: View {
    @ObservedObject var viewModel = ProviderViewVM()
    @State private var navigateToQuizView = false
    @State private var showErrorToast = false
    @State private var errorMessage = ""
    @State private var showProgress = false
    
    var body: some View {
        NavigationView{
            
            List {
                ForEach(viewModel.providers, id: \.self) { item in
                    NavigationLink(destination: ProviderDetailView(provider: item)) {
                        VStack(alignment: .leading) {
                            Text("Name: \(item.name)")
                        }
                    }
                }
            }
            .navigationTitle("Providers")
            .onAppear {
                viewModel.fetchProviders()
            }
            
        }.onChange(of: viewModel.providerState) { state in
            switch(state) {
            case .idle:
                showErrorToast = false
                showProgress = false
            case .loading:
                showProgress = true
                showErrorToast = false
            case .success:
                showProgress = false
                navigateToQuizView = true
            case .failure(let errorMessage):
                showProgress = false
                self.errorMessage = errorMessage
                showErrorToast = true
            }
        }
    }
}

#Preview {
    ProviderView()
}
