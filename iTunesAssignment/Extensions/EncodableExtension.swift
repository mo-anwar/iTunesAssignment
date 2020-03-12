//
//  EncodableExtension.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
