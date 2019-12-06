//
//  AppError.swift
//  ConcurrencyLab
//
//  Created by casandra grullon on 12/6/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

enum AppError : Error{
    case badURL(String)
    case networkClientError(Error)
    case noResponse
    case noData
    case badStatusCode(Int)
}
