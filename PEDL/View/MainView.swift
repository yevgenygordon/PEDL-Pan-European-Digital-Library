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
                    
                }
                
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
