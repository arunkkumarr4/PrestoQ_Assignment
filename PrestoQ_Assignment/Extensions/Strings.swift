//
//  Strings.swift
//  PrestoQ_Assignment
//
//  Created by Arun Kumar on 6/3/20.
//  Copyright © 2020 Arun Kumar. All rights reserved.
//

import Foundation

extension String {
    func localized(withComment comment: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: .main, value: "\(self)", comment: comment)
    }
    
    /// Apply strike font on text
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 1,
            range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }
}
