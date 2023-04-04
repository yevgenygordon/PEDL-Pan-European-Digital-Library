//
//  ResultsView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 30.03.23.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    
   
    
    @State var showContactDetail: Bool = false
    @State var alertOn: Bool = false
    @State var selectedIndex : Int = 0
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack{
            NavigationView{
                List{
                    ForEach(viewModel.items, id: \.self){item in
                        
                        HStack{
                            NavigationLink(destination: DetailView( item: item)) {
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
                                
                                
                                VStack(alignment: .leading){
                                    Text("\(item.title[0])")
                                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                                    //   .multilineTextAlignment(.leading)
                                        .padding(.bottom, 16)
                                    
                                    Text("\(item.type)")
                                        .font(.system(size: 14,weight: .semibold,design: .rounded))
                                    //   .multilineTextAlignment(.leading)
                                        .padding(.bottom, 16)
                                    
                                    
                                    
                                    Text("\(item.dataProvider[0])")
                                        .font(.system(size: 14,weight: .thin, design: .rounded))
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                    
                                 
                                    
                                   
                                    
                                }
                            }
                            .environmentObject(viewModel)
                            
                        }
                    }
                }
                .toolbar(content: {
                    
                    TextField("Search", text: $searchText)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                   
                    Button(action: {
                        self.viewModel.getInfo(findMe: searchText)
                    }) {
                        Text("Get Data")
                            
                            .bold()
                            .font(.system(size: 18))
                            .background(Color.white)
                            .cornerRadius(24)
                    }
                })
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            
            
            
            
            
            
        }
    }
    
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView().environmentObject(AuthService())
    }
 }

