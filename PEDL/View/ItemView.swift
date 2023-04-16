//
//  ItemView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    @State private var scale: CGFloat = 1.0
    let item: Items
    
    var body: some View {
       
        VStack {
            
            NavigationView {
               // WebView(url: URL(string: "https://www.otpusk24.de")!)
                WebView(url: URL(string: item.edmIsShownAt?[0] ?? "https://www.otpusk24.de")!)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    
                    }
           
             
          }
        .padding()
        
        
    }
}
/*

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(, item: I).environmentObject(AuthService())
    }
 }
 */
