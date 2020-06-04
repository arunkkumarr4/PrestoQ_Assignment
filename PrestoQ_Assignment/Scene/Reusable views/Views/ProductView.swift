//
//  ProductView.swift
//  PrestoQ_Assignment
//
//  Created by Arun Kumar on 6/2/20.
//  Copyright © 2020 Arun Kumar. All rights reserved.
//

import UIKit

final class ProductView: UIView {
    @IBOutlet private var productImageView: UIImageView!
    @IBOutlet private var oldPrice: UILabel!
    @IBOutlet private var newPrice: UILabel!
    @IBOutlet private var productDesc: UILabel!
    
    func configure(product: ManagerSpecials) {        
        guard let url = URL(string: product.imageUrl) else { return }
        productImageView.load(url: url)
        productDesc.text = product.displayName
        oldPrice.attributedText = product.originalPrice.strikeThrough()
        newPrice.text = product.price
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}
