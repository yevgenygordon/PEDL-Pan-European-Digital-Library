//
//  FireStoreViewModel.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 03.03.23.
//





import FirebaseFirestore



class FireStoreViewModel {
    
    var authService: AuthService = AuthService()
     let db = Firestore.firestore()
    private var pedlUserPath :String = "pedlUser"
    
    func fetchData(completion: @escaping ([String: Any]) -> Void) {
        db.collection("myCollection").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            guard let snapshot = snapshot else {
                print("No data found.")
                return
            }
            var data = [String: Any]()
            for document in snapshot.documents {
                let documentData = document.data()
                data[document.documentID] = documentData
            }
            completion(data)
        }
    }
    
    
    
    
    func writeData(pedlUserPath: String) {
        let data = [
            "name": "John Doe111",
            "age": 30,
            "email": "johndoe@example.com"
        ] as [String : Any]
        
        db.collection(pedlUserPath).document("johndoe").setData(data) { error in
            if let error = error {
                print("Error writing document: \(error.localizedDescription)")
            } else {
                print("Document successfully written.")
            }
        }
    }
    
}











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
