//
//  ProfilView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore

struct ProfilView: View {
    
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    @ObservedObject var fireStoreModel = FireStoreViewModel()
    
    @State var isImagePickerShowing = false
    @State var isSheetShowing = false
    @State var isPath = false
    @State var selectedImage: UIImage?
    @State var retrievedImages = [UIImage]()
  //  @State var userProfilList = [UserProfil]()
    
   // @State var userData = [UserProfil]()
  //  @State var user: UserProfil
    // Properties
    
    @State var personName: String
    @State var email: String
    @State var birthday = Date()
    @State var color: String
    @State var showCollection: Bool
    
    var body: some View {
        ZStack {
            VStack {
                
                
                    VStack(alignment: .center){
                        
                       
                        
                        if selectedImage != nil {
                            Image(uiImage: selectedImage! )
                                .resizable()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .overlay(alignment: .topTrailing,
                                         content: {
                                    
                                    
                                    if selectedImage != nil {
                                        
                                        Button {
                                            isImagePickerShowing = true
                                        } label: {
                                            Image(systemName: "photo.circle")
                                                .font(Font.system(.largeTitle))
                                                .offset(x: 20, y: -10)
                                        }
                                       
                                        Button {
                                            uploadFoto()
                                            
                                        } label: {
                                            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                                                .font(Font.system(.largeTitle))
                                                .offset(x: 80, y: -10)
                                        }
                                        
                                    }
                                    else {
                                        Button {
                                            isImagePickerShowing = true
                                        } label: {
                                            Image(systemName: "photo.circle")
                                                .font(Font.system(.largeTitle))
                                                .offset(x: 20, y: -10)
                                        }
                                    }
                                    
                                    
                                    
                                    
                                    
                                    
                                })
                                .padding(.bottom, 16)
                        }
                        else {
                            
                            if isPath == true {
                              
                                HStack{
                                    ForEach(retrievedImages, id: \.self) {  image in
                                        Image(uiImage: image)
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                            .clipShape(Circle())
                                            .overlay(alignment: .topTrailing,
                                                     
                                                     content: {
                                                Button {
                                                    isImagePickerShowing = true
                                                } label: {
                                                    Image(systemName: "photo.circle")
                                                        .font(Font.system(.largeTitle))
                                                        .offset(x: 20, y: -10)
                                                }
                                               
                                                
                                            })
                                        
                                       
                                    }
                                }
                                .offset(y: 0)
                                
                            }
                            else {
                                
                                Image("profil_noImage")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .clipShape(Circle())
                                    .overlay(alignment: .topTrailing,
                                             
                                             content: {
                                        Button {
                                            isImagePickerShowing = true
                                        } label: {
                                            Image(systemName: "photo.circle")
                                                .font(Font.system(.largeTitle))
                                                .offset(x: 20, y: -10)
                                        }
                                       
                                        
                                    })
                                    .padding(.bottom, 16)
                                
                            }
                            
                            
                            
                        }
                        
                       
                        
                        
                        
                        
                    }
                    .frame(height: 216)
                    .padding()
                    .foregroundColor(Color(red: 87 / 255, green: 110 / 255, blue: 131 / 255))
                    .sheet(isPresented: $isImagePickerShowing, onDismiss: nil){
                            ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing)
                        }
                    .onAppear{
                        retrievePhotos()
                        
                       
                    }
                    
                    
                    VStack(alignment: .center){
                        
                        Text("Name")
                            .font(.system(size: 14,weight: .regular, design: .rounded))
                        
                        Text(fireStoreModel.user?.personName ?? "")
                            .font(.system(size: 28,weight: .bold, design: .rounded))
                            .padding(.horizontal, 32)
                            .padding(.bottom, 24)
                            .multilineTextAlignment(.center)
                            .textFieldStyle(.roundedBorder)
                        
                    }
                    .foregroundColor(Color(red: 87 / 255, green: 110 / 255, blue: 131 / 255))
                    
                    
                    
                    VStack(alignment: .center){
                        
                        Text("Email")
                            .font(.system(size: 14,weight: .regular, design: .rounded))
                        Text(authService.user?.email ?? "")
                            .font(.system(size: 18,weight: .bold, design: .rounded))
                            .padding(.horizontal, 32)
                            .padding(.bottom, 24)
                            .multilineTextAlignment(.center)
                            .textFieldStyle(.roundedBorder)
                        
                        
                        
                    }
                    .foregroundColor(Color(red: 87 / 255, green: 110 / 255, blue: 131 / 255))
                    
                    
                    
                    // Birthday Datepicker
                    DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                        Text("Birthday")
                            .foregroundColor(Color(red: 87 / 255, green: 110 / 255, blue: 131 / 255))
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 24)
                    .foregroundColor(Color(red: 87 / 255, green: 110 / 255, blue: 131 / 255))
                    
                    
                    
                    // Show own collection picker
                    Toggle("Show own collection", isOn: $showCollection)
                        .padding(.horizontal, 32)
                        .padding(.bottom, 32)
                        .foregroundColor(Color(red: 87 / 255, green: 110 / 255, blue: 131 / 255))
                    
                    // Save Button
                    Button(action: {
                        
                        
                        fireStoreModel.writeProfilData(pedlUserPath: authService.user!.uid,  personName: personName, personBirthday: birthday, showCollection: showCollection)
                        
                    }) {
                        Text("Save")
                            .fontWeight(.bold)
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 24)
                
                
                
                 
                    Button("Log Out"){
                        authService.signOut()
                    }
                    
                    Spacer()
                }
                .onAppear {
                    fireStoreModel.fethUser(pedlUserPath: authService.user!.uid)
                    
                    
                    
            }
        }
            
        }
    
    
    func uploadFoto () {
        
        guard selectedImage != nil else {
            return
        }
        
        let storageRef = Storage.storage().reference()
        
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else {
            return
        }
        
        
        // File path and Name
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        // Upload that Data
        let uploadTask = fileRef.putData(imageData!, metadata: nil) {metadata, error in
            
            if error == nil && metadata != nil {
                
              // Save Reference to DB
                
                let db = Firestore.firestore()
                
                db.collection("UserImages").document(authService.user!.uid).setData(["url":path]){error in
                    
                    if error == nil {
                        
                        DispatchQueue.main.async {
                            // Add the uploaded Image to the list of Image for Display
                            self.retrievedImages.append(self.selectedImage!)
                        }
                        
                        
                    }
                }
                    
                    
                   
            }
            
        }
    }
    
    func retrievePhotos() {
        
        // Get Data from Database
        let db = Firestore.firestore()
        
        db.collection("UserImages").getDocuments {snapshot, error in
            
            if error == nil && snapshot != nil {
                var paths = [String]()
                
                for doc in snapshot!.documents{
                  
                    // Extrakt the Patch
                    paths.append(doc["url"] as! String)
                 }
                
                // Fetch the Data from Store
                for path in paths {
                    
                    let storageRef = Storage.storage().reference()
                    
                    let fileRef = storageRef.child(path)
                    
                    fileRef.getData(maxSize: 5 * 1024 * 1024){ data, error in
                        
                        // Check for Errors
                        if error == nil && data != nil {
                            if let image = UIImage(data: data!){
                                
                                DispatchQueue.main.async {
                                    retrievedImages.append(image)
                                    isPath = true
                                }
                                
                                
                            }
                            
                           
                           
                        }
                        
                        
                        
                    }
                }
            }
            
        }
    }
        
    }

/*

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(personName: "Load", email: "Load", color: "Red", showCollection: false).environmentObject(AuthService())
    }
 }*/
