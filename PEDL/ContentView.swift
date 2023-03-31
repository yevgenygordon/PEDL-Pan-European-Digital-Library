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
              
                
                TabView(selection: .constant(1)){
                   
                    
                    ResultsView()
                        .tabItem({
                            Label("My Collection",image: "button_myCollection")
                        })
                        .tag(0)
                    MainView()
                        .tabItem({
                            Label("Home", image: "button_Home")
                        })
                        .tag(1)
                    ProfilView(firstName: "Vasilij", familyName: "Terkin", email: "vt@mail.ru", color: "", blackMode: false)
                        .tabItem({
                            Label("Profil", image: "button_Profil")
                        })
                        .tag(2)
                   
                }
                
            }else{
                LoginView()
            }
        }.onAppear{
            authService.listentoAuthState()
        }
        
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthService())
    }
}
