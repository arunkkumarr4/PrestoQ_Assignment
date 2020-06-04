//
//  ManagerSpecialViewModel.swift
//  PrestoQ_Assignment
//
//  Created by Arun Kumar on 6/2/20.
//  Copyright © 2020 Arun Kumar. All rights reserved.
//

import UIKit

struct ManagerSpecialsViewModel {
    
    private let products: Products
    
    init(with products: Products) {
        self.products = products
    }
    
    var rowViewModel: [RowViewModel] {
        var rowViewModel: [RowViewModel] = []
        var productsArray: [ManagerSpecials] = []
        let canvasUnit = self.products.canvasUnit
        var screenWidth = UIScreen.main.bounds.width
        // Loop over all the managerSpecials
        for (index, special) in self.products.managerSpecials.enumerated() {
            //get the width each special
            let newWidth = special.width * canvasUnit
            // subtract with from screen to get remaining screen size
            screenWidth = screenWidth - newWidth
            // append ManagerSpecials in to array for rowViewModel
            productsArray.append(ManagerSpecials(displayName: special.displayName, height: special.height, imageUrl: special.imageUrl, originalPrice: special.originalPrice, price: special.price, width: newWidth))
            //Compare if there is not much screen space left
            if screenWidth < newWidth {
                //Add all the ManagerSpecials that can fit in one row per screen width
                rowViewModel.append(RowViewModel(managerSpecials: productsArray))
                //Reset values
                productsArray = []
                screenWidth = UIScreen.main.bounds.width
            } else if index == self.products.managerSpecials.endIndex-1 {
                // handling the last index
                rowViewModel.append(RowViewModel(managerSpecials: productsArray))
            }
        }
        
        return rowViewModel
    }
}

// MARK: - RowViewModel
struct RowViewModel {
    let managerSpecials: [ManagerSpecials]
}
