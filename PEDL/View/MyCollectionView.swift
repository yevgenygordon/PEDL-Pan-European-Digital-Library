//
//  MyCollectionView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 29.03.23.
//

import SwiftUI

struct MyCollectionView: View {
    
    var body: some View {
        
        
        NavigationView {
                    List {
                        NavigationLink("First Item", destination: Text("First View"))
                        NavigationLink("Second Item", destination: Text("Second View"))
                    }
                    .navigationTitle("My List")
                }
    }
}

struct MyCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MyCollectionView()
    }
}
