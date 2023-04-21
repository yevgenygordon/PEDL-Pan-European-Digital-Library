//
//  MyItemsDetailView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 18.04.23.
//

import SwiftUI

struct MyItemsDetailView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    let fireStoreModel = FireStoreViewModel()
    
    var item:MyItems
    
    var body: some View {
        
        VStack(alignment: .center){
            
            NavigationLink(destination: MyImageShowView( item: item)) {
                
                VStack(alignment: .center){
                    
                    AsyncImage(url: URL(string: item.edmPreview)) { phase in
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
                    + Text("\(item.title)")
                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                    
                }
                .frame(height: 60)
                
                HStack{
                  
                    Text("Creator: ")
                        .font(.system(size: 16,weight: .thin, design: .rounded))
                    + Text("\(item.dcCreator ?? "Creator unknown")" )
                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                }
                
                HStack{
                    
                    Text("Date: ")
                        .font(.system(size: 16,weight: .thin, design: .rounded))
                    + Text(item.year ?? "Date unknown")
                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                    
                }
                .padding(.bottom, 16)
                
                 HStack{
                    
                    Text("Publisher: ")
                        .font(.system(size: 16,weight: .thin, design: .rounded))
                    + Text(item.dataProvider )
                      .font(.system(size: 14,weight: .semibold,design: .rounded))
                    
                }
                 .frame(height: 40)
                 
                
                 HStack{
                    
                    Text("Country: ")
                        .font(.system(size: 16,weight: .thin, design: .rounded))
                     + Text("\(item.country )")
                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                    
                    Spacer()
                     
                     Text("Language: ")
                         .font(.system(size: 16,weight: .thin, design: .rounded))
                     + Text(item.language?.uppercased() ?? "")
                         .font(.system(size: 14,weight: .semibold,design: .rounded))
                        
                        
                    
                }
                
                
                
             //   Text(item.edmIsShownAt?[0] ?? "nix da")
                
            }
            
            
            HStack{
              
                NavigationLink(destination: MyItemView( item: item)) {
                    
                    
                        Image(systemName: "link")
                        Text("Link to source")
                            .font(.system(size: 14,weight: .semibold,design: .rounded) )
                }
                
                Spacer()
                
                
            }
            .padding(.top, 24)
            
            
           
        }
        .padding(.horizontal, 16)
        
       
        
    }
}
/*
struct MyItemsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyItemsDetailView()
    }
 }*/
