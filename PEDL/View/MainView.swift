//
//  MainView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 23.02.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authService: AuthService
    var body: some View {
        
        VStack{
            
            Text("Hello \(authService.user?.email ?? "")!")
            
            Button("Log Out"){
                authService.signOut()
            }.padding(40)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AuthService())
    }
}
