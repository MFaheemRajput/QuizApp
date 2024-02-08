//
//  ProviderDetailView.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 08/02/2024.
//

import SwiftUI

struct ProviderDetailView: View {
    @ObservedObject var viewModel = ProviderDetailViewVM()
    @State private var showErrorToast = false
    @State private var errorMessage = ""
    @State private var showProgress = false
    let provider: Provider
    
    var body: some View {
        NavigationView{
            VStack{
                if(showProgress){
                    ProgressView()
                } else {
                    if let feeds = viewModel.providersDetail?.data.en.feeds {
                        List(feeds, id: \.name) { feed in
                            NavigationLink(destination: QuizController()) {
                                VStack(alignment: .leading) {
                                    Text("Name: \(feed.name)")
                                    Text("URL: \(feed.url)")
                                }
                            }
                            
                        }
                        .navigationTitle("Feeds")
                    } else {
                        Text("No feeds found")
                    }
                }
                
            }
        }.onAppear {
            viewModel.fetchProviderDetail(self.provider)
        }
        .onChange(of: viewModel.providerState) { state in
            switch(state) {
            case .idle:
                showErrorToast = false
                showProgress = false
            case .loading:
                showProgress = true
                showErrorToast = false
            case .success:
                showProgress = false
            case .failure(let errorMessage):
                showProgress = false
                self.errorMessage = errorMessage
                showErrorToast = true
            }
        }
    }
}
