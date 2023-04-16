//
//  DetailView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    let fireStoreModel = FireStoreViewModel()
    
    

  //  @Binding var curentItem: Items
    let item: Items
  
    
    var body: some View {
        
        VStack(alignment: .center){
            
            NavigationLink(destination: ImageShowView( item: item)) {
                
                VStack(alignment: .center){
                    
                    AsyncImage(url: URL(string: item.edmPreview[0])) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                            
                            
                        case .failure(let error):
                            Text("Failed to load image: \(error.localizedDescription)")
                        @unknown default:
                            Text("Unknown error")
                        }
                    }
                    
                    
                    
                }
                .frame(width: 460,height: 360)
                .background(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
                
            }
           
    
          
            VStack(alignment: .leading){
                HStack{
                    Text("Titel: ")
                        .font(.system(size: 16,weight: .thin, design: .rounded))
                    + Text("\(item.title[0])")
                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                    
                }
                .frame(height: 60)
                
                HStack{
                  
                    Text("Creator: ")
                        .font(.system(size: 16,weight: .thin, design: .rounded))
                    + Text("\(item.dcCreator?[0] ?? "Creator unknown")" )
                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                }
                
                HStack{
                    
                    Text("Date: ")
                        .font(.system(size: 16,weight: .thin, design: .rounded))
                    + Text(item.year?[0] ?? "Date unknown")
                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                    
                }
                .padding(.bottom, 16)
                
                 HStack{
                    
                    Text("Publisher: ")
                        .font(.system(size: 16,weight: .thin, design: .rounded))
                    + Text(item.dataProvider[0] )
                      .font(.system(size: 14,weight: .semibold,design: .rounded))
                    
                }
                 .frame(height: 40)
                 
                
                 HStack{
                    
                    Text("Country: ")
                        .font(.system(size: 16,weight: .thin, design: .rounded))
                     + Text("\(item.country[0] )")
                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                    
                    Spacer()
                     
                     Text("Language: ")
                         .font(.system(size: 16,weight: .thin, design: .rounded))
                     + Text(item.language?[0].uppercased() ?? "")
                         .font(.system(size: 14,weight: .semibold,design: .rounded))
                        
                        
                    
                }
                
                
                
             //   Text(item.edmIsShownAt?[0] ?? "nix da")
                
            }
            
            
            HStack{
              
                NavigationLink(destination: ItemView( item: item)) {
                    
                    
                        Image(systemName: "link")
                        Text("Link to source")
                            .font(.system(size: 14,weight: .semibold,design: .rounded) )
                }
                
                Spacer()
                
                Button(action: {
                    
                    fireStoreModel.writeCollectionData(pedlUserPath: authService.user!.uid, item: item)
                    
                }) {
                    Image(systemName: "arrow.down.heart.fill")
                    Text("Save to own Collection")
                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                 }
                
            }
            .padding(.top, 24)
            
            
           
        }
        .padding(.horizontal, 16)
        
        
       
    }
}



