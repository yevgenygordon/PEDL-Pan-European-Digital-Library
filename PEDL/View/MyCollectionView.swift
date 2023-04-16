//
//  MyCollectionView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 29.03.23.
//

import SwiftUI
import Foundation
import CoreData


struct MyCollectionView: View {
    @EnvironmentObject var authService: AuthService
    
    @State var userProfilList = [UserProfil]()
        let fireStoreModel = FireStoreViewModel()
    
    var body: some View {
        
        /*
        VStack {
                    ForEach(userProfilList) { userProfil in
                        Text(userProfil.personName)
                        Text(userProfil.personEmail)
                        Text(userProfil.personBirthday.description)
                        Text(userProfil.showColection ? "true" : "false")
                    }
                }
                .onAppear {
                    fireStoreModel.loadUserProfiles { userProfilList in
                        self.userProfilList = userProfilList
                    }
                }
        
        */
        
        NavigationView {
                    List {
                        NavigationLink("First Item", destination: Text("First View"))
                        NavigationLink("Second Item", destination: Text("Second View"))
                    }
                    .navigationTitle("My List")
                }
    }
}

struct MyCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MyCollectionView().environmentObject(AuthService())
    }
}
