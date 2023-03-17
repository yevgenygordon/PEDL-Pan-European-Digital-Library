//
//  Test.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 17.03.23.
//

import SwiftUI

struct LanguageView: View {
    
    @EnvironmentObject var authService: AuthService
    @ObservedObject var viewModel = EuropeanaViewModel()
    
    let options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 47", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4", "Option 4"]
    @State var selectedOptions: Set<String> = []
    
    var body: some View {
        
        
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(options, id: \.self) { option in
                    Toggle(option, isOn: Binding(
                        get: { self.selectedOptions.contains(option) },
                        set: { isSelected in
                            if isSelected {
                                self.selectedOptions.insert(option)
                            } else {
                                self.selectedOptions.remove(option)
                            }
                        }
                    ))
                    .padding(.vertical, 8)
                }
            }
            .padding()
        }
        
        
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView().environmentObject(AuthService())
    }
}
