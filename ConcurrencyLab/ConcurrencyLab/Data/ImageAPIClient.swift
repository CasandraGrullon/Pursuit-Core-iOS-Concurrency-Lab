//
//  ImageAPIClient.swift
//  ConcurrencyLab
//
//  Created by casandra grullon on 12/6/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

struct ImageAPIClient {
    
    static func getPic(for urlString: String, completion: @escaping(Result<Data, AppError>)->()){
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkClientError(error)))
                return
            }
            
            if let data = data {
                dump(data)
                completion(.success(data))
            }
        }
        dataTask.resume()
    }
}
