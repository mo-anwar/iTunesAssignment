//
//  URLRequestConveritble.swift
//  nine-hundred-trips
//
//  Created by Vortex on 4/21/19.
//  Copyright © 2019 Ibtdi. All rights reserved.
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
