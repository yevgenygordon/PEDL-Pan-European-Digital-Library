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
    var personFirstName : String
    var personfamilyName: String
    var personEmail: String
    var personBirthday = Date()
  //  var personColor: String
    var blackMode: Bool
    
    var alertEditProfil :Bool = false
}
