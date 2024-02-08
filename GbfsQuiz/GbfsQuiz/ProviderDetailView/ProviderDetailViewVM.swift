//
//  ProviderDetailViewVM.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 08/02/2024.
//

import Foundation


class ProviderDetailViewVM:ObservableObject{
    @Published private(set) var providerState:ProviderState = .idle
    @Published private(set) var providersDetail:ProviderDetail?
    @Published private(set) var provider:Provider?
    
    init(){
     
    }
    
    func fetchProviderDetail(_ provider : Provider){
        self.providerState = .loading
        self.provider = provider
        if let systemInfoProvider = self.provider?.autoDiscoveryURL {
            ProviderLoader.shared.fetchGbfsdata(systemInfoProvider) { providerDetail in
                guard let pd = providerDetail else {
                    self.providerState = .failure("Somthing went wrong")
                    return
                }
                self.providersDetail = pd
                self.providerState = .success
            }

        } else {
            providerState = .failure("no data found")
        }
        
        self.providersDetail = ProviderLoader.shared.providerDetail
        
        if(self.providersDetail == nil){
            providerState = .failure("no data found")
        } else{
            providerState = .success
        }
        
    }
}
