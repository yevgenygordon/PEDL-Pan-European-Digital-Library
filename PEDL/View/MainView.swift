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
    
    @State var showFindView = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        
        ZStack{
            
            
            
            VStack{
                HStack{
                    Image("PEDL_Logo_Small")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 195)
                        .padding(16)
                    Spacer()
                    Button(action: {
                        self.showFindView.toggle()
                    }){
                        Image("button_Search")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 25)
                            .padding(16)
                    }
                    
                    }
                
                
                
                HStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack(spacing: 50){
                            
                            ForEach(viewModel.theme){ theme in
                                
                                GeometryReader { geometry in
                                    theme.themeImage
                                        .rotation3DEffect(Angle(degrees: geometry.frame(in: .global).minX - 20) / -20, axis: (x: 0, y: 10, z: 0))
                                        .shadow(color: Color.gray, radius: 10,x: 5,y: 5 )
                                }
                                .frame(width: 195)
                                
                               }
                            
                            }
                        }
                }
                .padding(16)
                
                Spacer()
                
            }
            .scaleEffect(showFindView ? 0.98 : 1)
          //  .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0))
           // .shadow(color: Color.black.opacity(0.2),radius: 20, x: 0, y: 20)
           // .offset(y: showFindView ? -200 : 0)
            .rotation3DEffect(Angle(degrees: showFindView ? -10 : 0), axis: (x: 10, y: 0, z: 0))
          //  FindView(findMe: "")
            ResultsView()
                .offset(y: showFindView ? 0 : 1000)
                .offset(y: viewState.height)
            
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
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
