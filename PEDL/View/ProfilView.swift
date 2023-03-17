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
    // Properties
    @State var firstName: String
    @State var familyName: String
    @State var email: String
    @State var birthday = Date()
    @State var color: String
    @State var blackMode: Bool
    
    var body: some View {
        VStack {
            
            
            HStack{
                Image(systemName: "person.circle.fill")
                
                // First Name Textfield
                TextField("First Name", text: $firstName)
                   
                
                // Family Name Textfield
                TextField("Family Name", text: $familyName)
                   
            } .padding()
            
            HStack(){
                // Email Textfield
                TextField("Email", text: $email)
                } .padding()
            
           
            
            // Birthday Datepicker
            DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                Text("Birthday")
            }
            .padding()
            
            // Color Picker
            Picker("Color", selection: $color) {
                Text("Red").tag("Red")
                Text("Green").tag("Green")
                Text("Blue").tag("Blue")
            }
            .padding()
            
            // Black mode Toggle
            Toggle("Black Mode", isOn: $blackMode)
                .padding()
            
            // Save Button
            Button(action: {
                // TODO: Implement save action
            }) {
                Text("Save")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        
    }
}


struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(firstName: "Vasilij", familyName: "Terkin", email: "vt@mail.ru", color: "Red", blackMode: false)
    }
}
