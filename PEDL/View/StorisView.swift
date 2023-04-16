//
//  TestView.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 12.04.23.
//

import SwiftUI

struct StorisView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Stories")
                .font(.system(size: 16, weight: .heavy))
                .frame(alignment: .center)
                .kerning(0.1)
               
               
             Text("Explore cultural heritage stories in online \n exhibitions and blogs")
                .lineLimit(2)
                .font(.system(size: 13))
               // .frame(alignment: .center)
                .kerning(1)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 16)
            
            
            Image("button_Storys")
                .shadow(color: Color.gray, radius: 10,x: 2,y: 2 )
            
         }
        .foregroundColor(Color(red: 87 / 255, green: 110 / 255, blue: 131 / 255))
        .padding(.horizontal, 16)
       
       
        
        
    }
}

struct StorisView_Previews: PreviewProvider {
    static var previews: some View {
        StorisView()
    }
}
