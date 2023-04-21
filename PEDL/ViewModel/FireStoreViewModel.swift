//
//  FireStoreViewModel.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 03.03.23.
//





import FirebaseFirestore



class FireStoreViewModel: ObservableObject {
    
    @Published var user: UserProfil?
    @Published var myCollection: [MyItems] = []
    
    
    var authService: AuthService = AuthService()
    let db = Firestore.firestore()
    
  //  private var pedlUserPath :String = "pedlUser"
    
   
   
    
    
    func fethUser(pedlUserPath: String) {
        db.collection(pedlUserPath).document("UserProfil").getDocument { document, error in
          if let document = document {
            do {
              let data = try document.data(as: UserProfil.self)
                    self.user = data
                
            }
            catch {
              print(error)
            }
          }
        }
      }
    
    
    
    
    
   
    
    
    func fetchData(pedlUserPath: String, completion: @escaping ([MyItems]) -> Void) {
        
        
        db.collection(pedlUserPath).document("UserCollection")
            .collection("NewCollection").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            guard let snapshot = snapshot else {
                print("No data found.")
                return
            }
            var myCollection = [MyItems]()
            for document in snapshot.documents {
               
                    do {
                        let documentData = try document.data(as: MyItems.self)
                        myCollection.append(documentData)
                    }
                catch {
                    print(error)
                }
                }
             
            completion(myCollection)
        }
    }
    
    
    
   
    
    
    
    
    
    func writeProfilData(pedlUserPath: String, personName: String, personBirthday: Date, showCollection: Bool) {
        let data = [
            "personName": personName,
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
        
      
        
        db.collection(pedlUserPath).document("UserCollection")
            .collection("NewCollection").document()
            .setData(data) { error in
            if let error = error {
                print("Error writing document: \(error.localizedDescription)")
            } else {
                print("Document successfully written.")
            }
        }
    }
    
    
    
    
}





