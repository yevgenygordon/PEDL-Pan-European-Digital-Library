//
//  FindView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import SwiftUI

struct FindView: View {
    
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
        @State var selectedOptions: Set<String> = []
    
    
    
    var body: some View {
        
        VStack {
            
            Form {
                Section("Search"){
                    TextField("Text", text: $viewModel.text)
                  }
                
                
                Section{
                    Picker(selection: $viewModel.typOfMedia,
                           label: Text("Typ of Media"),
                           content: {
                        Text("Image").tag(0)
                        Text("Text").tag(1)
                        Text("3D").tag(2)
                    }
                    )
                }
                
                Section{
                    Picker(selection: $viewModel.searchtheme,
                           label: Text("Theme"),
                           content: {
                        Text("Archäologie").tag(0)
                        Text("Kunst").tag(1)
                        Text("Industrie").tag(3)
                        Text("Mode").tag(4)
                        Text("Manuskript").tag(5)
                        Text("Migration").tag(6)
                        Text("Karte").tag(7)
                        Text("Musik").tag(8)
                        Text("Natur").tag(9)
                        Text("Fotografie").tag(10)
                        
                         
                    }
                    )
                }
                
                Section("Providing Country"){
                    TextField("Country", text: $viewModel.providingCountry)
                  }
                Section{
                    HStack {
                        Text("Language")
                        Spacer()
                        Button("Select"){
                            
                        }
                    }
                  }
                
                Section{
                    HStack {
                        Text("Institution")
                        Spacer()
                        Button("Select"){
                            
                        }
                     }
                  }
                
                
                
               
                
                
                    }
            
                 }
             }
        
        
    }


struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView().environmentObject(AuthService())
    }
    }

