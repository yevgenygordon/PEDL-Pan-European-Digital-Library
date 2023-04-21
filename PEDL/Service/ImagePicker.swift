//
//  ImagePicker.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 17.04.23.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    
    @Binding var selectedImage: UIImage?
    @Binding var isImagePickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
       
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(piker: self)
    }
    
    
}

class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var parent: ImagePicker
    
    init(piker: ImagePicker) {
        self.parent = piker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        print("Image Selected")
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            DispatchQueue.main.async {
                
                self.parent.selectedImage = image
            }
            
            
        }
        // Dismis the Picker
        parent.isImagePickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled")
        
        // Dismis the Picker
        parent.isImagePickerShowing = false
    }
}
