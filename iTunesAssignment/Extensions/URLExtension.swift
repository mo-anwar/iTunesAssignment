//
//  URLExtension.swift
//  iqproject
//
//  Created by Tarek Sabry on 12/27/19.
//  Copyright © 2019 Vortex. All rights reserved.
//

import Foundation

extension URL {
    
    func withPathParameters(_ parameters: [String: Any]?) -> URL {
        guard var urlString = self.absoluteString.removingPercentEncoding, let parameters = parameters else { return self }
        
        for parameter in parameters {
            urlString = urlString.replacingOccurrences(of: "{\(parameter.key)}", with: "\(parameter.value)")
        }
        
        guard let url = URL(string: urlString) else { return self }
        return url
    }
    
}
