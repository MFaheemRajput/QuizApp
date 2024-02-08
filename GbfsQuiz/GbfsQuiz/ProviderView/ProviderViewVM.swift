//
//  ProviderViewVM.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 06/02/2024.
//

import Foundation

class ProviderViewVM:ObservableObject{
    @Published private(set) var providerState:ProviderState = .idle
    @Published private(set) var providers:[Provider] = []
    
    init(){
        
    }
    
    func fetchProviders(){
        self.providers.removeAll()
        ProviderLoader.shared.readCSVFromFile()
        self.providers = ProviderLoader.shared.providers
    }
}
