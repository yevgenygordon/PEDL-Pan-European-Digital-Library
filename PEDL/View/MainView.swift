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
                    
                    Image("button_Search")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 25)
                        .padding(16)
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
            
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AuthService())
    }
}
