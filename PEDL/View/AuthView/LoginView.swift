//
//  LoginView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 23.02.23.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var authService: AuthService
    var body: some View {
        
        VStack{
            
            TextField("Email", text: $email)
                .padding(20)
            SecureField("Password", text: $password)
                .padding(20)
            
            Button("Register"){
                authService.signUp(email: email, password: password)
            }.padding(40
            )
            Button("Login"){
                authService.signIn(email: email, password: password)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthService())
    }
}
