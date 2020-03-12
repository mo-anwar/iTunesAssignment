//
//  SearchWorker.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
import Alamofire

enum SearchNetworkRouter: URLRequestConvertible {
    
    case search(parameters: SearchModel.Request)
    
    var method: HTTPMethod {
        switch self {
            
        case .search:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .search(let parameters):
            return try? parameters.asDictionary()
        }
    }
    
    var url: URL {
        let endpoint: String
        switch self {
        case .search:
            endpoint = Constants.SearchEndpoints.search
        }
        return URL(string: Constants.baseURL)!.appendingPathComponent(endpoint)
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .search:
            return URLEncoding.queryString
        }
    }
}
