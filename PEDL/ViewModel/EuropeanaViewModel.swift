//
//  EuropeanaViewModel.swift
//  PEDL
//
//  Created by Yevgeny Gordon on 16.02.23.
//

import Foundation

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

