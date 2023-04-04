//
//  DetailView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 01.03.23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()

  //  @Binding var curentItem: Items
    let item: Items
  
    
    var body: some View {
        
        VStack{
            Text(item.title[0])
            Text(item.edmIsShownAt?[0] ?? "nix da")
            Text(item.dcCreator?[0] ?? "nix da")
            Text(item.dataProvider[0] )
            Text(item.country[0])
            Text(item.language?[0] ?? "nix da")
            Text(item.year?[0] ?? "nix da")
        }
        
        
        NavigationView {
           // WebView(url: URL(string: "https://www.otpusk24.de")!)
            WebView(url: URL(string: item.edmIsShownAt?[0] ?? "https://www.otpusk24.de")!)
                .navigationTitle("Example").font(Font.footnote)
                }
    }
}

/*
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Items(title: [""], country: [""], edmPreview: [""], year: [""], dataProvider: [""], edmIsShownAt: [""], dcCreator: [""])).environmentObject(AuthService())
    }
 }
 */
