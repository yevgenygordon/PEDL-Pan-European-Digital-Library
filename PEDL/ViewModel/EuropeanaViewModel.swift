//
//  EuropeanaViewModel.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 16.02.23.
//

import Foundation
import SwiftUI

struct EuropeanaObject: Codable {
    let id: String
    let title: String
    let dataProvider: String  // Daten Provider
    let year: String // Jahr
    
    let edmIsShownAt: URL  //link zu ganzem Resource
    let edmPreview: URL     //link zu Hauptbild
    
    let edmConcept: URL     // Link zu Material
    let edmConceptLabel: String  //
    
    let dcTitleLangAware: String
    
    
    
    
    
    // weitere relevante Felder, die von der API zurückgegeben werden
}
struct Items: Codable, Hashable {
  
    let title: [String]
    let country: [String]
    let edmPreview: [String]
    let year: [String]?
    var language: [String]?
    let dataProvider: [String]
    let edmIsShownAt: [String]?
    let dcCreator: [String]?
    let type: String
    
   
    //   let dcCreatorLangAware: [DcCreatorLangAware]
    
}
struct DcCreatorLangAware {
    let def: [String]
}


struct EUData: Codable {
    var items: [Items] = []
}





class EuropeanaViewModel: ObservableObject {
    
   // @Published var curentItem : Items
    
    
    @Published var edmPreview = "https://images.dog.ceo/breeds/affenpinscher/n02110627_6965.jpg"
    @Published var title: String = "vasja"
    @Published var itemsCollection: EUData = EUData()
    
    @Published var items:[Items] = []
    
    
    
    @Published var theme = [CollectionTheme(themeName: "Maps and Geography", themeImage: Image("theme1") ),
                            CollectionTheme(themeName: "Manuscripts", themeImage: Image("theme2")),
                            CollectionTheme(themeName: "Industrial Heritage", themeImage: Image("theme3")),
                            CollectionTheme(themeName: "Fashion", themeImage: Image("theme4")),
                            CollectionTheme(themeName: "Art", themeImage: Image("theme5")),
                            CollectionTheme(themeName: "Archaeology", themeImage: Image("theme6")),
                            CollectionTheme(themeName: "Migration", themeImage: Image("theme7")),
                            CollectionTheme(themeName: "Music", themeImage: Image("theme8")),
                            CollectionTheme(themeName: "Natural History", themeImage: Image("theme9")),
                            CollectionTheme(themeName: "Newspapers", themeImage: Image("theme10")),
                            
    ]
    @Published  var searchText = ""
    @Published  var text :String = "Leonardo%2Bda%2BVinci"
    @Published  var findMe :String = "Leonardo%2Bda%2BVinci"
    @Published  var typOfMedia = 0
    @Published  var searchtheme = 0
    @Published  var providingCountry = ""
    @Published  var count :Int = 0
    @Published  var date :Date =  Date()
                let language = ["Option 1", "Option 2", "Option 3", "Option 4"]
    @Published  var selectedLanguage: Set<String> = []

    

    func getInfo(findMe: String) {
       let findMe = convertSpaces(input: findMe)
       let rows = 99
       let lang = "de"
       let siteCounter = 1
        
   

        
        let url = URL(string: "https://api.europeana.eu/record/v2/search.json?landingpage=true&lang=\(lang)&media=true&profile=standard&query=\(findMe)&rows=\(rows)&start=\(siteCounter)&thumbnail=true&wskey=cetaticithec%20")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(EUData.self, from: data)
                DispatchQueue.main.async {
                    
                    self.items = decodedData.items
                    
                   // self.title = decodedData.items[3].title[0]
                   
                   
                }
            } catch {
                print(error)
                print("API nicht geladen")
            }
        }
        task.resume()
    }

   
    func convertSpaces(input: String) -> String {
        let result = input.replacingOccurrences(of: " ", with: "%2B")
        return result
    }

    
    
    
    
    
   
    
}

