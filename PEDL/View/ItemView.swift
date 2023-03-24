//
//  ItemView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    var body: some View {
       
        VStack {
            Text("Hello \(authService.user?.email ?? "")")
            
            Image("theme1")
                .imageScale(.large)
                .foregroundColor(.accentColor)
           
            
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
            
            
            Button("Log Out"){
                authService.signOut()
            }.padding(40)
            
        }
        .padding()
        
        
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView().environmentObject(AuthService())
    }
}
