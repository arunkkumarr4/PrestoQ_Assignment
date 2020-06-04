//
//  ImageView.swift
//  PrestoQ_Assignment
//
//  Created by Arun Kumar on 6/3/20.
//  Copyright © 2020 Arun Kumar. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
