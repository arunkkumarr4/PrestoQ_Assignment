//
//  ManagerSpecialsDataModel.swift
//  PrestoQ_Assignment
//
//  Created by Arun Kumar on 6/2/20.
//  Copyright © 2020 Arun Kumar. All rights reserved.
//

import UIKit

struct Products: Codable {
    let canvasUnit: CGFloat
    let managerSpecials: [ManagerSpecials]
}

struct ManagerSpecials: Codable {
    let displayName: String
    let height: CGFloat
    let imageUrl: String
    let originalPrice: String
    let price: String
    let width: CGFloat
    
    private enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case height, imageUrl
        case originalPrice = "original_price"
        case price, width
    }
}
