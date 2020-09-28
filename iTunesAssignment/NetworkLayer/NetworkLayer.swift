//
//  NetworkLayer.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 9/28/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
import Alamofire

class NetworkLayer {
    
    class func request<T: Decodable>(
        _ request: URLRequestConvertible,
        decodedTo type: T.Type,
        completionHandler: @escaping (Swift.Result<T, Error>) -> Void
    ) {
        Alamofire.request(request).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
