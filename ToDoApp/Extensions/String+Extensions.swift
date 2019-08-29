//
//  String+Extensions.swift
//  ToDoApp
//
//  Created by Daniyar Erkinov on 8/29/19.
//  Copyright © 2019 danchopon.com. All rights reserved.
//

import Foundation

extension String {
    var percentEncoded: String {
        let allowedCharacters = CharacterSet(charactersIn: "~!@#$%^&*()-+=[]\\}{,./?><").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        return encodedString
    }
}
