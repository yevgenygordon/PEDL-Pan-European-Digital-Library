//
//  MyItems.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 18.04.23.
//


import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

struct MyItems:  Identifiable, Codable, Hashable {
  
    @DocumentID var id : String? = UUID().uuidString
    let title: String
    let country: String
    let edmPreview: String
    let year: String?
    var language: String?
    let dataProvider: String
    let edmIsShownAt: String?
    let dcCreator: String?
 //   let type: String
    
   
    //   let dcCreatorLangAware: [DcCreatorLangAware]
    
}
