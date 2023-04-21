//
//  MainView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 23.02.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    
  //  @State var showFindView = false
    @State var viewState = CGSize.zero
   
    
    let myColor = Color(_ColorLiteralType(red: 52, green: 152, blue: 219, alpha: 100))
    
    var body: some View {
        
        ZStack{
            
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack{
                HStack{
                    Image("PEDL_Logo_Small")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 195)
                        .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        viewModel.showFindView.toggle()
                    }){
                        Image("button_Search")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 25)
                            .padding(.horizontal)
                    }
                    
                    }
                
                Divider()
                    .frame( height: 5)
                    .overlay(Color(red: 63 / 255, green: 87 / 255, blue: 106 / 255))
                
                VStack(alignment: .leading){
                    Text("Discover Europe’s digital cultural heritage")
                        .font(.system(size: 16, weight: .heavy))
                        .frame(alignment: .center)
                        .kerning(0.1)
                       
                     Text("Search, save and share art, books, films and music from thousands of cultural institutions")
                        .font(.system(size: 13))
                        .frame(alignment: .center)
                        .kerning(1)
                 }
                
                .foregroundColor(Color(red: 87 / 255, green: 110 / 255, blue: 131 / 255))
                .padding(.horizontal, 16)
               // .foregroundColor(Color(red: 63 / 255, green: 87 / 255, blue: 106 / 255))
                    
                
               
                
                
                
                VStack{
                    
                    Text("Explore by theme")
                        .font(.system(size: 32, weight: .regular))
                        .frame(alignment: .center)
                        .kerning(0.1)
                        .foregroundColor(Color(red: 63 / 255, green: 87 / 255, blue: 106 / 255))
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack(spacing: 50){
                            
                            ForEach(viewModel.theme){ theme in
                                
                                GeometryReader { geometry in
                                    
                                    Button(action: {
                                        viewModel.showInternetView.toggle()
                                        viewModel.urlLink = "https://www.europeana.eu/en/themes/\(viewModel.convertSpacesToMinus(input: theme.themeName).lowercased())"
                                        
                                    }){
                                        
                                        theme.themeImage
                                            .rotation3DEffect(Angle(degrees: geometry.frame(in: .global).minX - 20) / -20, axis: (x: 0, y: 10, z: 0))
                                            .shadow(color: Color.gray, radius: 10,x: 5,y: 5 )
                                        
                                    }
                                    
                                }
                                .frame(width: 195)
                               }
                            }
                        }
                    }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                
                Button(action: {
                    viewModel.showInternetView.toggle()
                    viewModel.urlLink = "https://www.europeana.eu/en/stories"
                    
                }){
                    StorisView()
                }
                .offset(y: -50)
                
               
              
                
            }
           // .scaleEffect(viewModel.showFindView ? 0.98 : 1)
          //  .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0))
           // .shadow(color: Color.black.opacity(0.2),radius: 20, x: 0, y: 20)
           // .offset(y: showFindView ? -200 : 0)
           // .rotation3DEffect(Angle(degrees: viewModel.showFindView ? -10 : 0), axis: (x: 10, y: 0, z: 0))
          //  FindView(findMe: "")
            ResultsView()
                .offset(y: viewModel.showFindView ? 0 : 1000)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            InternetView(url: viewModel.urlLink)
                .offset(y: viewModel.showInternetView ? 0 : 1000)
                .offset(y: viewState.height)
              //  .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            
             //   .onTapGesture {
              //      self.showFindView.toggle()
              //  }
              /*  .gesture(
                    DragGesture().onChanged{ value in
                        self.viewState = value.translation
                        if self.viewState.height > 200 {
                            self.showFindView = false
                        }
                      }
                        .onEnded{value in
                            self.viewState = .zero
                            
                        }
                )
               */
            
            
           
            
              
        }
        
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AuthService())
    }
}
