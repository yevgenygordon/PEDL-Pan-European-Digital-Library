//
//  UserProfil.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI


struct UserProfil : Identifiable, Codable{
    @DocumentID var id : String? = UUID().uuidString
    var personName : String
  //  var personEmail: String
    var personBirthday = Date()
  
    var showCollection: Bool
    
  /*
    init?(dictionary: [String: Any]) {
        guard let personName = dictionary["personName"] as? String,
              let personEmail = dictionary["personEmail"] as? String,
              let showCollection = dictionary["showCollection"] as? Bool
              else { return nil }

        self.personName = personName
        self.personEmail = personEmail
        self.showCollection = showCollection

        if let timestamp = dictionary["personBirthday"] as? Timestamp {
            self.personBirthday = timestamp.dateValue()
        }
    }
 */
    
}
//   var alertEditProfil :Bool = false
   //  var personColor: String
    // var blackMode: Bool
