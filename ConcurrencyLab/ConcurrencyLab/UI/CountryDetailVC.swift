//
//  CountryDetailVC.swift
//  ConcurrencyLab
//
//  Created by casandra grullon on 12/6/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class CountryDetailVC: UIViewController {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI(){
        guard let details = country else {
            return
        }
        countryNameLabel.text = details.name
        capitalLabel.text = "capital: \(details.capital)"
        populationLabel.text = "population: \(details.population)"
        
        ImageAPIClient.getPic(for: "https://www.countryflags.io/\(details.alpha2Code)/flat/64.png") { [unowned self] (result) in
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
