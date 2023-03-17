//
//  FireStoreViewModel.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 03.03.23.
//

/*

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
@MainActor class FireStoreViewModel : ObservableObject{
    @Published var pedlUser : UserProfil
    
    private var db = Firestore.firestore()
    private var pedlUserPath :String = "pedlUser"
    init(){
        fetchUserProfil()
    }
    
    
    func fetchUserProfil(){
        db.collection(pedlUserPath).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No Documents Found")
                return
            }
            
            self.pedlUser = documents.map({ queryDocumentSnapshot  -> UserProfil in
                let data = queryDocumentSnapshot.data()
                let personFirstName = data["personFirstName"] as? String ?? ""
                let personfamilyName = data["personfamilyName"] as? String ?? ""
                let personEmail = data["personEmail"] as? String ?? ""
                let blackMode = data["blackMode"] as? Bool ?? false
                let docID = queryDocumentSnapshot.documentID
                return UserProfil(id:docID,personFirstName: personFirstName, personfamilyName: personfamilyName, personEmail: personEmail, blackMode: blackMode)
            })
        }
        
    }
}
 */
