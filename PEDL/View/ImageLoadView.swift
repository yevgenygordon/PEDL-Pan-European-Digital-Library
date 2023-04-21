//
//  ImageLoadView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 17.04.23.
//

import SwiftUI
import PhotosUI
import FirebaseStorage

let storage = Storage.storage()
let storageRef = storage.reference()

struct ImageLoadView: View {
    
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        
        VStack{
            if selectedImage != nil {
                Image(uiImage: selectedImage! )
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
            Button {
                isImagePickerShowing = true
            } label: {
                Text("Lade Image")
            }
        }
        .sheet(isPresented: $isImagePickerShowing, onDismiss: nil){
            ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing)
        }
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ImageLoadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoadView()
    }
}
