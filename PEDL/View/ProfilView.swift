//
//  ProfilView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import SwiftUI

struct ProfilView: View {
    
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    
    @State var userProfilList = [UserProfil]()
    let fireStoreModel = FireStoreViewModel()
   // @State var userData = [UserProfil]()
  //  @State var user: UserProfil
    // Properties
    @State var personName: String
    @State var email: String
    @State var birthday = Date()
    @State var color: String
    @State var showCollection: Bool
    
    var body: some View {
        VStack {
            
                
                VStack(alignment: .center){
                    Image("theme1")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(alignment: .topTrailing,
                                 
                                 content: {
                            Image(systemName: "photo.circle")
                                .font(Font.system(.largeTitle))
                                .offset(x: 20, y: -10)
                            
                        })
                        .padding(.bottom, 16)
                    
                } .padding()
                    .foregroundColor(Color(red: 87 / 255, green: 110 / 255, blue: 131 / 255))
                
                VStack(alignment: .center){
                    
                    Text("Name")
                        .font(.system(size: 14,weight: .regular, design: .rounded))
                    
                    TextField("Name", text: $personName)
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
                    TextField("Email", text: $email)
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
                fireStoreModel.loadUserProfiles { userProfilList in
                    self.userProfilList = userProfilList
                }
            }
            
        }
        
    }



struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(personName: "Vasilij", email: "vt@mail.ru", color: "Red", showCollection: false)
    }
}
