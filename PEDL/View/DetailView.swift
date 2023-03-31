//
//  DetailView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()

//    @Published var item = Items()
  
    
    var body: some View {
        
        
        NavigationView {
                    WebView(url: URL(string: "https://www.example.com")!)
                        .navigationTitle("Example")
                }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView().environmentObject(AuthService())
    }
}
