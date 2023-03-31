//
//  ImageURLService.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 28.03.23.
//

import Foundation
import SwiftUI
import UIKit

struct ImageURLService: View {
    var imageUrl: String

    var body: some View {
        let imageData = try! Data(contentsOf: URL(string: imageUrl)!)
        let uiImage = UIImage(data: imageData)!
        return Image(uiImage: uiImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            
            
    }
}
