//
//  URLRequestConveritble.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
import Alamofire

protocol URLRequestConvertible: Alamofire.URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    
}

extension URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
