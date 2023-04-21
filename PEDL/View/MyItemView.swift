//
//  MyItemView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 18.04.23.
//

import SwiftUI

struct MyItemView: View {
    
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    @State private var scale: CGFloat = 1.0
    let item: MyItems
    
    var body: some View {
        
        VStack {
            
            NavigationView {
               // WebView(url: URL(string: "https://www.otpusk24.de")!)
                WebView(url: URL(string: item.edmIsShownAt ?? "https://www.otpusk24.de")!)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    
                    }
           
             
          }
        .padding()
        
        
    }
}

/*

struct MyItemView_Previews: PreviewProvider {
    static var previews: some View {
        MyItemView()
    }
 }
 */
