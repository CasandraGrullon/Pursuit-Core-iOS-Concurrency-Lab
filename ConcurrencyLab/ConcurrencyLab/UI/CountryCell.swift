//
//  CountryCell.swift
//  ConcurrencyLab
//
//  Created by casandra grullon on 12/6/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var countryPopulationLabel: UILabel!
    
    var country: Country?
    
    func configureCell(for country: Country) {
        countryNameLabel.text = country.name
        countryCapitalLabel.text = country.capital
        countryPopulationLabel.text = "population of: \(country.population)"
        
        ImageAPIClient.getPic(for: "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png") { [unowned self] (result) in
            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.flagImage.image = UIImage(data: image)
                }
            }
        }
        
    }
}
