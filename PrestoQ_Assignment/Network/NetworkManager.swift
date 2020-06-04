//
//  NetworkManager.swift
//  PrestoQ_Assignment
//
//  Created by Arun Kumar on 6/2/20.
//  Copyright © 2020 Arun Kumar. All rights reserved.
//

import Foundation

enum ManagerSpecialError: Error {
    case noDataFound
    case cannotProcessData
}

struct ServiceManager {
    private let urlString = "https://raw.githubusercontent.com/Swiftly-Systems/code-exercise-ios/master/backup"
    
    func getManagerSpecials(compeletion: @escaping (Result<ManagerSpecialsViewModel, ManagerSpecialError>) -> Void) {
        guard let url = URL(string: urlString) else { fatalError("Error") }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let jsonData = data else {
                compeletion(.failure(.noDataFound))
                return
            }
            
            do {
                let productsResponse = try JSONDecoder().decode(Products.self, from: jsonData)
                let managerSpecialViewModel = ManagerSpecialsViewModel(with: productsResponse)
                compeletion(.success(managerSpecialViewModel))                
            } catch {
                compeletion(.failure(.cannotProcessData))
            }
        }
        task.resume()
    }
}
