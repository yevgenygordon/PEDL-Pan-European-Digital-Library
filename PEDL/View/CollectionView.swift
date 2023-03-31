//
//  CollectionView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import SwiftUI
import UIKit

struct ImageURLService2: View {
    var imageUrl: String

    var body: some View {
        let imageData = try! Data(contentsOf: URL(string: imageUrl)!)
        let uiImage = UIImage(data: imageData)!
        return Image(uiImage: uiImage)
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .aspectRatio(contentMode: .fit)
            .padding()
        
            
            
    }
}


struct CollectionView: View {
    
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    
    @State var showContactDetail: Bool = false
    @State var alertOn: Bool = false
    @State var selectedIndex : Int = 0
   
    
    var body: some View {
        VStack{
            
            ScrollView(.vertical){
                
                
                  
                        
                    
                
                
                LazyVStack{
                    
                    ForEach(viewModel.items, id: \.self){item in
                        
                            HStack(alignment: .top){
                               
                                VStack (alignment: .leading){
                                    AsyncImage(url: URL(string: item.edmPreview[0])) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame( width: 100)
                                                    .padding()
                                                
                                            case .failure(let error):
                                                Text("Failed to load image: \(error.localizedDescription)")
                                            @unknown default:
                                                Text("Unknown error")
                                            }
                                    }
                                }.background(Color.blue)
                                
                            
                                
                                VStack(alignment: .leading){
                                    Text("\(item.title[0])")
                                        .font(.system(size: 17,weight: .bold,design: .rounded))
                                     //   .multilineTextAlignment(.leading)
                                        .padding(.bottom, 16)
                                        
                                    
                                   
                                    Text("\(item.dataProvider[0])")
                                        .font(.system(size: 14,weight: .thin, design: .rounded))
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(width: .infinity)
                                .background(Color.blue)
                               
                                .padding(16)
                                
                            }.background(Color.red)
                                
                            
                           
                            
                       
                        }
                        
                    
                    }
                }
          
            Button(action: {
                self.viewModel.getInfo(findMe: viewModel.findMe)
            }) {
                Text("Get Data")
                    .padding()
                    .bold()
                    .font(.system(size: 46))
                    .background(Color.white)
                    .cornerRadius(24)
            }
            
        }
        
        
        
        
        
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView().environmentObject(AuthService())
    }
}
