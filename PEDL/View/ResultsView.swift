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
    
   
    
    @State var showDetail: Bool = false
    @State var alertOn: Bool = false
    @State var selectedIndex : Int = 0
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack{
            NavigationView{
                List{
                    ForEach(viewModel.items, id: \.self){item in
                        
                        // mit isActive spring zu falschen detail
                        
                        HStack{
                            NavigationLink(destination: DetailView( item: item)
                                .onAppear
                                    {
                                        self.showDetail = true
                                    }
                                ) {
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
                    
                    Button(action: {
                        viewModel.showFindView.toggle()
                    }) {
                       Image(systemName: "xmark")
                    }
                    .frame(alignment: .leading)
                    
                    Spacer()
                    
                    TextField("Search", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(width: 250)
                    
                    
                    Spacer()
                   
                    Button(action: {
                        self.viewModel.getInfo(findMe: searchText)
                        viewModel.showResult = true
                    }) {
                       Image(systemName: "magnifyingglass.circle")
                    }
                })
                .onAppear
                    {
                        self.showDetail = false
                    }
                
                
               
             
            }
            
          
            if !showDetail && (viewModel.showResult != nil) {
                
                HStack {
                   
                    
                        Button(action: {
                            
                            if viewModel.collectionSite > 1 {
                                
                            viewModel.collectionSite = viewModel.collectionSite - 1
                                self.viewModel.getInfo(findMe: searchText)
                            }
                            
                        }, label: {
                            Image(systemName: "chevron.left.square.fill")
                            .foregroundColor(Color.white)
                            .font(Font.system(.largeTitle))
                            
                        })
                        
                   
                    Spacer()
                     
                    
                    
                    Text("Seite ")
                        .foregroundColor(Color.white)
                    
                     Text("\(viewModel.collectionSite)")
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    
                    
                        Button(action: {
                            if viewModel.collectionSite < 9 {
                            viewModel.collectionSite = viewModel.collectionSite + 1
                                self.viewModel.getInfo(findMe: searchText)
                            }
                        }, label: {
                            Image(systemName: "chevron.right.square.fill")
                            .foregroundColor(Color.white)
                            .font(Font.system(.largeTitle))
                        })
                        
                    
                                      
                                  }
                .cornerRadius(25)
                .frame(width: 250)
                .background(Color(red: 63 / 255, green: 87 / 255, blue: 106 / 255))
                .offset(y:320)
                
            }
            
           
           
            
            
        }
        .offset(y: viewModel.showFindView ? 1000 : 0)
        
    }
    
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView().environmentObject(AuthService())
    }
 }

