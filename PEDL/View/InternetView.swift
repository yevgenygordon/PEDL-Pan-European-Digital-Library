//
//  InternetView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 18.04.23.
//

import SwiftUI

struct InternetView: View {
    
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    @State private var scale: CGFloat = 1.0
    let url: String
    
    var body: some View {
        
        VStack {
            
            NavigationView {
               // WebView(url: URL(string: "https://www.otpusk24.de")!)
                WebView(url: URL(string: url )!)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .toolbar(content: {
                        
                        Button(action: {
                            viewModel.showInternetView.toggle()
                        }) {
                           Image(systemName: "xmark")
                        }
                        .frame(alignment: .leading)
                        Text("Back")
                        
                        
                    })
                    
                    }
            
           
             
          }
        .offset(y: viewModel.showInternetView ? 1000 : 0)
        
    }
}

struct InternetView_Previews: PreviewProvider {
    static var previews: some View {
        InternetView(url: "https://www.otpusk24.de").environmentObject(AuthService())
    }
}
