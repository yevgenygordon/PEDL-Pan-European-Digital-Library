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
struct Items: Codable {
    
    let title: [String]
   // let year: String
    let dataProvider: [String]
    let country: [String]
    let edmPreview: [String]
    
}

struct EUData: Codable {
    var items: [Items] = []
}





class EuropeanaViewModel: ObservableObject {
    
    @Published var title: String = ""
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
                            CollectionTheme(themeName: "Photography", themeImage: Image("theme11")),
                            CollectionTheme(themeName: "Sport", themeImage: Image("theme12")),
                            CollectionTheme(themeName: "World War I", themeImage: Image("theme13")),
    ]
    
    @Published  var text :String = ""
    @Published  var typOfMedia = 0
    @Published  var searchtheme = 0
    @Published  var providingCountry = ""
    @Published  var count :Int = 0
    @Published  var date :Date =  Date()
                let language = ["Option 1", "Option 2", "Option 3", "Option 4"]
    @Published  var selectedLanguage: Set<String> = []

    

    func getInfo() {
        let url = URL(string: "https://api.europeana.eu/record/v2/search.json?profile=standard&query=Leonardo%2Bda%2BVinci&rows=2&start=1&wskey=cetaticithec")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(EUData.self, from: data)
                DispatchQueue.main.async {
                    self.title = decodedData.items[1].country[0]
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

    struct Joke: Codable {
        let value: String
    }
    
    
    
    
    
    
   
    
}

