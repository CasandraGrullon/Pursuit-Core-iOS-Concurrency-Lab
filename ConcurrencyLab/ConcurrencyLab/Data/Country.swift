//
//  Country.swift
//  ConcurrencyLab
//
//  Created by casandra grullon on 12/6/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct Country: Decodable {
    let name: String
    let capital: String
    let population: Int
    let flag: String
    let alpha2Code: String

}


extension Country {
    static func getCountry() -> [Country] {
        var country = [Country]()
        
        guard let fileURL = Bundle.main.url(forResource: "country", withExtension: "json") else {
            fatalError("wrong url name")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let countryData = try JSONDecoder().decode([Country].self, from: data)
            country = countryData
        }catch {
            print(error)
        }
        
        return country
    }
}
