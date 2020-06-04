//
//  ProductTableViewCell.swift
//  PrestoQ_Assignment
//
//  Created by Arun Kumar on 6/2/20.
//  Copyright © 2020 Arun Kumar. All rights reserved.
//

import UIKit

final class ProductTableViewCell: UITableViewCell {
    @IBOutlet private var productsStack: UIStackView!
    func configure(rowModel: RowViewModel) {
        productsStack.removeAllArrangedSubviews()
        // Loop over all the specials
        for special in rowModel.managerSpecials {
            guard let productView = UINib(nibName: "ProductView", bundle: .main).instantiate(withOwner: nil, options: nil).first as? ProductView else { return }
            // Inject `special` to configure custom view for each special
            productView.configure(product: special)
            productsStack.addArrangedSubview(productView)
        }
    }
}
