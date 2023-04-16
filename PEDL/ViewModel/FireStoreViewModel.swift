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
  //  private var pedlUserPath :String = "pedlUser"
    
    
    
    func loadUserProfiles(completion: @escaping ([UserProfil]) -> Void) {
            db.collection("UserProfil").getDocuments { querySnapshot, error in
                if let error = error {
                    print("Error getting documents: \(error.localizedDescription)")
                    completion([])
                } else {
                    var userProfiles = [UserProfil]()
                    for document in querySnapshot!.documents {
                        if let userProfile = UserProfil(dictionary: document.data()) {
                            userProfiles.append(userProfile)
                        }
                    }
                    completion(userProfiles)
                }
            }
        }
    
    
    func fetchData(completion: @escaping ([String: Any]) -> Void) {
        db.collection(authService.user!.uid).getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            guard let snapshot = snapshot else {
                print("No data found.")
                return
            }
            var userData = [String: Any]()
            for document in snapshot.documents {
                let documentData = document.data()
            //    let personName = data[document.documentID] as? String ?? ""
              //  let personEmail = data[document.personName] as? String ?? ""
                userData[document.documentID] = documentData
               
            }
            completion(userData)
        }
    }
    
    
    
   
    
    
    
    
    
    func writeProfilData(pedlUserPath: String, personName: String, personBirthday: Date, showCollection: Bool) {
        let data = [
            "personName": "\(personName)",
            "personBirthday": personBirthday,
            "showCollection": showCollection,
           
        ] as [String : Any]
        
        db.collection(pedlUserPath).document("UserProfil").setData(data) { error in
            if let error = error {
                print("Error writing document: \(error.localizedDescription)")
            } else {
                print("Document successfully written.")
            }
        }
    }
    
    func writeCollectionData(pedlUserPath: String, item:Items) {
        
        let data = [
            "title": item.title[0],
            "country": item.country[0],
            "edmPreview": item.edmPreview[0],
            "year": item.year?[0] ?? "",
            "language": item.language?[0] ?? "",
            "dataProvider": item.dataProvider[0],
            "edmIsShownAt": item.edmIsShownAt?[0] ?? "",
            "dcCreator": item.dcCreator?[0] ?? "",
           
            
            
            
           
        ] as [String : Any]
        
      
        
        db.collection(pedlUserPath).document("UserCollection").collection(item.dataProvider[0]).document().setData(data) { error in
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
