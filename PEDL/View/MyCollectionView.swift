//
//  MyCollectionView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 29.03.23.
//

import SwiftUI
import Foundation
import CoreData


struct MyCollectionView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    @ObservedObject var fireStoreModel = FireStoreViewModel()
    
    @State var showMyDetail: Bool = false
    
 //   @State var userProfilList = [UserProfil]()
       
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(fireStoreModel.myCollection){item in
                    
                    // mit isActive spring zu falschen detail
                    
                    HStack{
                        NavigationLink(destination: MyItemsDetailView( item: item)
                            .onAppear
                                {
                                    self.showMyDetail = true
                                }
                            ) {
                            AsyncImage(url: URL(string: item.edmPreview)) { phase in
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
                            
                            
                            VStack(alignment: .leading){
                                Text("\(item.title)")
                                    .font(.system(size: 14,weight: .semibold,design: .rounded))
                                //   .multilineTextAlignment(.leading)
                                    .padding(.bottom, 16)
                                
                            
                                
                                
                                
                                Text("\(item.dataProvider)")
                                    .font(.system(size: 14,weight: .thin, design: .rounded))
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                             
                                
                               
                                
                            }
                        }
                        .environmentObject(viewModel)
                        
                    }
                }
            }
            
         
        }.onAppear {
            fireStoreModel.fetchData(pedlUserPath:authService.user!.uid, completion: { colletion in
                fireStoreModel.myCollection = colletion
                
            })
            }
       
        
    }
}
/*

struct MyCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MyCollectionView().environmentObject(AuthService())
    }
 }
 */
