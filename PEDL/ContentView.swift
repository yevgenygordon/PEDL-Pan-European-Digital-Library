//
//  ContentView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 16.02.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    
    var body: some View {
        Group{
            if authService.user != nil{
                MainView()
            }else{
                LoginView()
            }
        }.onAppear{
            authService.listentoAuthState()
        }
        
        
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Text(viewModel.title)
                .background(Color.white)
                .padding()
                .font(.system(size: 23))
            
            
            
            Button(action: {
                self.viewModel.getInfo()
                
                
                
            }) {
                Text("Get Data")
                    .padding()
                    .bold()
                    .font(.system(size: 46))
                    .background(Color.white)
                    .cornerRadius(24)
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthService())
    }
}
