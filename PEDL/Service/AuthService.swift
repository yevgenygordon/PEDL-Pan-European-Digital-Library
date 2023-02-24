//
//  AuthService.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 23.02.23.
//

import Foundation
import FirebaseAuth

final class AuthService: ObservableObject {
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listentoAuthState (){
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self  = self else {
                return
            }
            self.user = user
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            if let error = error{
                print(" Error ocured \(error)")
                return
            }
        }
        
    }
    
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in
            if let error = error{
                print(" Error ocured \(error)")
                return
            }
        }
        
    }
    
   
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        }catch let error{
            print(" Error ocured \(error)")
         }
     }
    
    
    
}
