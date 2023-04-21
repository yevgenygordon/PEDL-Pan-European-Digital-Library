//
//  MyImageShowView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 18.04.23.
//

import SwiftUI
import UniformTypeIdentifiers

struct MyImageShowView: View {
    
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    @State private var scale: CGFloat = 1.0
    let item: MyItems
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack {
        
        
        AsyncImage(url: URL(string: item.edmPreview)) { phase in
               switch phase {
               case .empty:
                   ProgressView()
               case .success(let image):
                   image
                       .resizable()
                       .scaledToFit()
                       .scaleEffect(scale)
                    //   .aspectRatio(contentMode: .fit)
                       .padding()
                   
                   /* Problem (bleibt nach gesture haengen)
                    
                    
                       .gesture(DragGesture()
                                       .onChanged { gesture in
                                           offset = gesture.translation
                                       }
                                       .onEnded { gesture in
                                           offset = CGSize.zero
                                       }
                                   )
                       .offset(x: offset.width, y: offset.height)
                   
                    */
                   
               case .failure(let error):
                   Text("Failed to load image: \(error.localizedDescription)")
               @unknown default:
                   Text("Unknown error")
               }
           }
          
           Spacer()
            
           HStack {
                                 Button(action: {
                                     self.scale *= 1.2
                                 }, label: {
                                     Image(systemName: "plus.circle.fill")
                                 })
                                 .padding()
                                 
                                 Button(action: {
                                     self.scale /= 1.2
                                 }, label: {
                                     Image(systemName: "minus.circle.fill")
                                 })
                                 .padding()
                             }
           
          
           
           
          
           
       }
       .padding()
       
       
   }
}

/*
struct MyImageShowView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageShowView()
    }
 }*/
